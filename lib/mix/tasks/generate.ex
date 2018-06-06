defmodule Mix.Tasks.Codacy.Credo.Generate do
  alias Codacy.Credo.Generator.Patterns
  alias Codacy.Credo.Generator.Description
  use Mix.Task

  @shortdoc "Generate patterns.json"
  @moduledoc @shortdoc

  def run(_argv) do
    # TODO: Accept Version argument
    #             Will have to download specified version & build from that

    Patterns.generate()
    Description.generate_json()
    Description.generate_md()

    # If you need to regenerate the test templates, reenable this
    # Tests.generate()
  end
end
