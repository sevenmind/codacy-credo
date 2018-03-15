defmodule Codacy.Credo do
  alias Codacy.Credo.Config
  require Logger
  use Application

  def start(_type, _args) do
    # I'm Just a fancy Script that starts Credo with the prescribed startup settings
    Credo.start(nil, nil)

    "/src/"
    |> Config.load_config()
    |> Config.extract_credo_config()
    |> run()

    System.stop(1)

    {:ok, self()}
  end

  def run(%Config{codacy_config: :use_default} = config) do
    File.cd(config.path)

    struct(Credo.Execution, argv: ["--strict"])
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
