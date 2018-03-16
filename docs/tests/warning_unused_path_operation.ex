##Patterns: warning_unused_path_operation 
 ##Warning: warning_unused_path_operation
defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
    x = parameter1 + parameter2

    Path.join(parameter1, x)

    parameter1
  end
end

defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
    parameter1 + parameter2
    |> Path.join(parameter1)

    parameter1
  end
end

defmodule CredoSampleModule do
  defp print_issue(w) do
    for x <- [1, 2, 3] do
      # this goes nowhere!
      Path.join(w, ",")
      x
    end
  end
end

defmodule CredoSampleModule do
  defp print_issue(%Issue{check: check, message: message, filename: filename, priority: priority} = issue, source_file) do
    if issue.column do
      [
        :this_goes_nowhere,
        Path.join(w, ",") # THIS is not the last_call!
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
      Path.count(filename)
      IO.puts "x"
    end
  end
end

defmodule CredoSampleModule do
  defp print_issue(%Issue{check: check, message: message, filename: filename, priority: priority} = issue, source_file) do
    if issue.column do
      IO.puts "."
    else
      case check do
        true -> false
        _ ->
          Path.reduce(arr, fn(w) ->
            [:this_goes_nowhere, Path.join(w, ",")]
          end)
      end
    end

    IO.puts "x"
  end
end

defmodule CredoSampleModule do
  defp print_issue(%Issue{check: check, message: message, filename: filename, priority: priority} = issue, source_file) do
    if issue.column do
      IO.puts "."
    else
      [:this_goes_nowhere, Path.join(w, ",")] # THIS is not the last_call!
    end

    IO.puts
  end
end

defmodule CredoSampleModule do
  defp print_issue(%Issue{check: check, message: message, filename: filename, priority: priority} = issue, source_file) do
    if issue.column do
      IO.puts "."
    else
      [:this_goes_nowhere, Path.join(w, ",")] # THIS is not the last_call!
      IO.puts " "
    end
  end
end

defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
    Path.reject(parameter1, &is_nil/1)
    parameter1
  end
  def some_function2(parameter1, parameter2) do
   Path.reduce(parameter1, parameter2)
   parameter1
   end
   def some_function3(parameter1, parameter2) do
     Path.reduce(parameter1, parameter2)
     parameter1
   end
end

defmodule CredoSampleModule do
  defp something(bin) do
    for segment <- Path.flat_map(segment, &(&1.blob)), segment != "" do
      Path.join(segment)
      segment
    end
  end
end
