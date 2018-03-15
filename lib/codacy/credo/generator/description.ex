defmodule Codacy.Credo.Generator.Description do
  @moduledoc """
  Builds description.json from Credo checks
  """

  alias Codacy.Credo.Generator.Patterns

  def generate_md() do
    File.cwd!()
    |> load_checks
    |> Enum.map(&elem(&1, 0))
    |> Enum.map(&write_md/1)
  end

  def write_md(check) do
    name = pattern_id(check)

    File.write!("./docs/description/#{name}.md", check.explanation, [:binary])
  end

  def generate_json() do
    File.cwd!()
    |> load_checks
    |> Enum.map(&elem(&1, 0))
    |> description_json
    |> write_description_json
  end

  def load_checks(dir) do
    dir
    |> Credo.ConfigFile.read_or_default()
    |> Map.get(:checks)
  end

  def description_json(checks) do
    Enum.map(checks, &build_check_description/1)
  end

  def build_check_description(check) do
    pattern_id = pattern_id(check)

    %{
      patternId: pattern_id,
      title: title_of_check(pattern_id),
      description: description_of_check(check),
      timeToFix: 5,
      parameters: parameter_descriptions(check)
    }
  end

  def write_description_json(descriptions) do
    encoded = Poison.encode!(descriptions, pretty: true)
    File.write!("./docs/description/description.json", encoded, [:binary])
  end

  defp pattern_id(check), do: Patterns.check_pattern_id({check})

  @doc """
  Transform Check into vaguely human readible title

  ## examples
    iex> Codacy.Credo.Generator.Description.title_of_check("design_tag_fixme")
    "Design Tag Fixme"
  """
  def title_of_check(pattern_id) do
    pattern_id
    |> String.split("_")
    |> Enum.map(&String.capitalize/1)
    |> Enum.join(" ")
  end

  @doc """
    Pulls first line of explanation as 'description'

  ## examples
    iex> Codacy.Credo.Generator.Description.description_of_check(Credo.Check.Readability.TrailingBlankLine)
    "Files should end in a trailing blank line."
  """
  def description_of_check(check) do
    check.explanation
    |> String.split("\n\n")
    |> Enum.at(0)
    |> String.replace("\n", " ")
  end

  @doc """
  Format Check descriptions for Codacy Docs

  ## Examples
    iex> Codacy.Credo.Generator.Description.parameter_descriptions(Credo.Check.Readability.StringSigils)
    [%{name: "maximum_allowed_quotes", description: "The maximum amount of escaped quotes you want to tolerate."}]
  """
  def parameter_descriptions(check) do
    check.explanation_for_params
    |> Enum.map(&explanation_to_description/1)
  end

  defp explanation_to_description({name, description}) do
    %{
      name: name |> Atom.to_string(),
      description: description
    }
  end
end
