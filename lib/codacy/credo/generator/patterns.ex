defmodule Codacy.Credo.Generator.Patterns do
  @moduledoc """
  Builds patterns.json from checks specified in `Credo.ConfigFile`
  """

  def generate() do
    File.cwd!()
    |> load_checks
    |> patterns_json
    |> write_patterns
  end

  def load_checks(dir) do
    dir
    |> Credo.ConfigFile.read_or_default()
    |> Map.get(:checks)
  end

  def write_patterns(patterns) do
    encoded = Poison.encode!(patterns, pretty: true)
    File.write!("./docs/patterns.json", encoded, [:binary])
  end

  @doc """
  Utility function to get a map of pattern_ids => Check module
  """
  def pattern_id_map do
    File.cwd!()
    |> load_checks
    |> Enum.map(&elem(&1, 0))
    |> Enum.map(fn check -> {check_pattern_id({check}), check} end)
    |> Map.new()
  end

  @doc """
  Convert Credo.Check into a valid Patterns Map
  """
  def check_to_pattern(check) do
    %{
      patternId: check_pattern_id(check),
      level: check_to_level(check),
      category: check_to_category(check),
      parameters: check_to_parameters(check)
    }
  end

  def patterns_json(checks) do
    %{
      name: "credo",
      version: Credo.version(),
      patterns: Enum.map(checks, &check_to_pattern/1)
    }
  end

  @doc """
  Transform Check params into Codacy Parameters

  ## Examples
    iex> Codacy.Credo.Generator.Patterns.check_to_parameters({Credo.Check.Refactor.PipeChainStart})
    [%{name: "excluded_functions", default: []}]
  """
  @spec check_to_parameters(tuple) :: [map]
  def check_to_parameters({check, params}) when params != false do
    check.params_names
    |> Enum.map(
      &(fn name ->
          format_parameters({name, params[name] || check.params_defaults[name]})
        end).(&1)
    )
  end

  def check_to_parameters({check, false}), do: check_to_parameters({check})

  def check_to_parameters({check}) do
    check.params_defaults
    |> Enum.map(&format_parameters/1)
  end

  defp format_parameters({name, default}) do
    %{
      name: name |> Atom.to_string(),
      default: format_default(default)
    }
  end

  # Regex needs to be coerced into a string, not sure what to do when we convert this back to regex
  defp format_default(default) when is_list(default), do: Enum.map(default, &format_default/1)
  defp format_default(%Regex{} = regex), do: Regex.source(regex)
  defp format_default(default), do: default

  @doc """
  Converts Check from config into Codacy priority

  ## Example
    iex> Codacy.Credo.Generator.Patterns.check_to_level({Credo.Check.Refactor.LongQuoteBlocks})
    "Warning"
    iex> Codacy.Credo.Generator.Patterns.check_to_level({Credo.Check.Refactor.LongQuoteBlocks, [priority: :low]})
    "Info"
  """
  @spec check_to_level(tuple) :: String.t()
  def check_to_level({check}), do: priority_to_level(check.base_priority)

  def check_to_level({_check, [priority: priority]}) do
    priority
    |> Credo.Check.to_priority()
    |> priority_to_level()
  end

  def check_to_level({check, _opts}), do: priority_to_level(check.base_priority)

  @doc """
  Convert Credo Priority to Codacy Level

  ## Example
    iex> Codacy.Credo.Generator.Patterns.priority_to_level(10)
    "Warning"
    iex> Codacy.Credo.Generator.Patterns.priority_to_level(11)
    "Error"
  """
  @spec priority_to_level(integer) :: String.t()
  def priority_to_level(priority) do
    case priority do
      x when x > 10 -> "Error"
      x when x >= 1 -> "Warning"
      _ -> "Info"
    end
  end

  @doc """
  Convert Check Categories into Codacy Categories
  """
  @spec check_to_category(tuple) :: String.t()
  def check_to_category(check) do
    #   ErrorProne, CodeStyle, UnusedCode, Security, Compatibility, Performance, Documentation

    case elem(check, 0).category do
      :warning -> "ErrorProne"
      _ -> "CodeStyle"
    end
  end

  @doc """
  Convert Check to acceptable patternId

  ## Example
    iex> Codacy.Credo.Generator.Patterns.check_pattern_id({Credo.Check.Refactor.LongQuoteBlocks})
    "refactor_long_quote_blocks"
    iex> Codacy.Credo.Generator.Patterns.check_pattern_id({Credo.Check.Refactor.LongQuoteBlocks, [option: :options]})
    "refactor_long_quote_blocks"
  """
  @spec check_pattern_id({atom}) :: String.t()
  def check_pattern_id({check}) do
    check
    |> Atom.to_string()
    |> String.replace_leading("Elixir.Credo.Check.", "")
    |> String.replace(".", "")
    |> Macro.underscore()
  end

  def check_pattern_id({check, _}), do: check_pattern_id({check})
end
