defmodule Codacy.Credo.Output do
  alias Credo.Execution
  alias Codacy.Credo.Generator.Patterns

  def print_results(%Execution{ results: results}) do
    results["credo.issues"]
    |> Enum.map(&format_issue/1)
    |> Enum.map(&pretty_print_issue/1)
  end

  def complain_about_invalid_source_files([]), do: nil
   def complain_about_invalid_source_files(invalid_source_files) do
    invalid_source_files
    |> Enum.map(&(&1.filename))
    |> Enum.map(&pp_invalid_files/1)
  end

  defp format_issue(issue) do
    %{
      filename: issue.filename,
      message: issue.message,
      line: issue.line_no,
      patternId: Patterns.check_pattern_id({issue.check})
    }
  end

  defp pretty_print_issue(issue) do
    IO.puts(Poison.encode!(issue))
  end

  defp pp_invalid_files(filename) do
    IO.puts(Poison.encode!(%{
      filename: filename,
      message: "error parsing file"
    }))
  end
end
