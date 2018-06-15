defmodule Codacy.Credo.Config do
  defstruct path: nil,
            codacy_config: nil,
            credo_config: %{}

  def codacy_json_exists?(%__MODULE__{path: path}) do
    path
    |> Path.join(".codacy.json")
    |> File.exists?()
  end

  @doc """
  Load & decode .codacy.json
  """
  def parse_codacy_json(%__MODULE__{path: path} = config) do
    with {:ok, file} <- File.read(path <> ".codacy.json"),
         {:ok, json} <- Poison.decode(file, keys: :atoms!) do
      %__MODULE__{config | codacy_config: json}
    else
      {:error, error} ->
        raise inspect(error)
    end
  end

  def load_config(path) do
    config = %__MODULE__{path: path}

    case codacy_json_exists?(config) do
      true -> parse_codacy_json(config)
      false -> %__MODULE__{config | codacy_config: :use_default}
    end
  end

  def extract_credo_config(%__MODULE__{codacy_config: :use_default} = config), do: config

  def extract_credo_config(%__MODULE__{codacy_config: codacy} = config) do
    credo_config = %{
      name: "default",
      files: %{
        included: codacy.files,
        excluded: [~r"/_build/", ~r"/deps/"]
      },
      strict: true,
      min_priority: -99,
      checks: extract_checks(codacy)
    }

    %__MODULE__{config | credo_config: credo_config}
  end

  defp extract_checks(%{tools: tools}) do
    patterns_map = Codacy.Credo.Generator.Patterns.pattern_id_map()

    tools
    |> Enum.find(fn tool -> tool.name == "credo" end)
    |> Map.get(:patterns)
    |> Enum.map(&transform_pattern_to_check(&1, patterns_map))
  end

  defp transform_pattern_to_check(%{patternId: pattern_id, parameters: parameters}, patterns_map)
       when length(parameters) > 0 do
    {
      patterns_map[pattern_id],
      Enum.map(parameters, &parameters_to_check_params/1)
    }
  end

  defp transform_pattern_to_check(%{patternId: pattern_id}, patterns_map) do
    {patterns_map[pattern_id]}
  end

  defp parameters_to_check_params(%{name: name, value: value}) do
    {
      name |> String.to_atom(),
      value
    }
  end
end
