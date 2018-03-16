##Patterns: warning_unused_file_operation
defmodule CredoSampleModule do
  defp print_issue(w) do
    for x <- [1, 2, 3] do
      # this goes nowhere!
 ##Warning: warning_unused_file_operation
      File.read(w, ",")
      x
    end
  end
end

defmodule CredoSampleModule do
  defp print_issue(%Issue{check: check, message: message, filename: filename, priority: priority} = issue, source_file) do
    if issue.column do
      [
        :this_goes_nowhere,
 ##Warning: warning_unused_file_operation
        File.read(w, ",") # THIS is not the last_call!
      ]
      IO.puts "."
    else
      IO.puts "x"
    end
  end
end

defmodule CredoSampleModule do
  defp print_issue(%Issue{check: check, message: message, filename: filename, priority: priority} = issue, source_file) do
    if issue.column do
      IO.puts "."
    else
 ##Warning: warning_unused_file_operation
      File.stat(filename)
      IO.puts "x"
    end
  end
end

defmodule CredoSampleModule do
  defp print_issue(%Issue{check: check, message: message, filename: filename, priority: priority} = issue, source_file) do
    if issue.column do
      IO.puts "."
    else
 ##Warning: warning_unused_file_operation
      [:this_goes_nowhere, File.read(w, ",")] # THIS is not the last_call!
    end

    IO.puts
  end
end

defmodule CredoSampleModule do
  defp print_issue(%Issue{check: check, message: message, filename: filename, priority: priority} = issue, source_file) do
    if issue.column do
      IO.puts "."
    else
 ##Warning: warning_unused_file_operation
      [:this_goes_nowhere, File.read(w, ",")] # THIS is not the last_call!
      IO.puts " "
    end
  end
end
