defmodule Codacy.Credo do
  alias Codacy.Credo.Config
  require Logger
  use Application

  def start(_type, _args) do
    # I'm Just a fancy Script that starts Credo with the prescribed startup settings
    Credo.Application.start(nil, nil)

    Config.srcPath()
    |> Config.load_config()
    |> Config.extract_credo_config()
    |> run()

    System.stop(0)

    {:ok, self()}
  end

  def run(%Config{codacy_config: :use_default} = config) do
    File.cd(config.path)

    struct(Credo.Execution, argv: ["--strict", "-a"])
    |> Credo.Execution.Task.ParseOptions.call(nil)
    |> Credo.Execution.Task.ConvertCLIOptionsToConfig.call(nil)
    |> Credo.Execution.Task.DetermineCommand.call(nil)
    |> Codacy.Credo.Runner.run()
    |> Codacy.Credo.Output.print_results()
  end

  def run(%Config{credo_config: credo_config} = config) do
    File.cd(config.path)

    struct(Credo.Execution, credo_config)
    |> Credo.Execution.start_servers()
    |> Credo.Execution.Task.DetermineCommand.call(nil)
    |> Codacy.Credo.Runner.run()
    |> Codacy.Credo.Output.print_results()
  end
end
