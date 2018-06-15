defmodule Codacy.Credo.Runner do
  # A cut down copy of Credo.CLI.Command.Suggest
  alias Codacy.Credo.Output
  alias Credo.Execution
  alias Credo.Sources
  alias Credo.CLI.Filter

  def run(exec) do
    exec
    |> load_and_validate_source_files()
    |> Credo.CLI.Task.PrepareChecksToRun.call()
    |> run_checks()
    |> determine_success()
  end

  defp load_and_validate_source_files(exec) do
    {valid_source_files, invalid_source_files} =
      exec
      |> Sources.find()
      |> Credo.Backports.Enum.split_with(& &1.valid?)

    Output.complain_about_invalid_source_files(invalid_source_files)

    exec
    |> Execution.put_source_files(valid_source_files)
  end

  defp run_checks(%Execution{} = exec) do
    source_files = Execution.get_source_files(exec)

    Credo.Check.Runner.run(source_files, exec)
    exec
  end

  defp determine_success(exec) do
    issues =
      exec
      |> Execution.get_issues()
      |> Filter.important(exec)
      |> Filter.valid_issues(exec)

    Execution.put_result(exec, "credo.issues", issues)
  end
end
