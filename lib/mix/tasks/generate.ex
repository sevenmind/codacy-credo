defmodule Mix.Tasks.Codacy.Credo.Generate do
  alias Codacy.Credo.Patterns
  alias Codacy.Credo.Description
  use Mix.Task

  @shortdoc "Generate patterns.json"
  @moduledoc @shortdoc

  def run(argv) do
    # TODO: Accept Version argument
    #             Will have to download specified version & build from that

    Patterns.generate()
    Description.generate_json()
    Description.generate_md()
  end
end
