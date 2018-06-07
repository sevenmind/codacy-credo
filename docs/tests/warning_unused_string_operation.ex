##Patterns: warning_unused_string_operation
defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
    x = parameter1 + parameter2

 ##Warning: warning_unused_string_operation
    String.split(parameter1)

    parameter1
  end
end

defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
    parameter1 + parameter2
 ##Warning: warning_unused_string_operation
    |> String.split(parameter1)

    parameter1
  end
end

defmodule CredoSampleModule do
  defp print_issue(%Issue{check: check, message: message, filename: filename, priority: priority} = issue, source_file) do
    if issue.column do
      [
        :this_goes_nowhere,
 ##Warning: warning_unused_string_operation
        String.duplicate("^", w) # THIS is not the last_call!
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
 ##Warning: warning_unused_string_operation
      String.trim(filename)
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
          Enum.reduce(arr, fn(w) ->
            [:this_goes_nowhere, String.duplicate("^", w)]
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
 ##Warning: warning_unused_string_operation
      [:this_goes_nowhere, String.duplicate("^", w)] # THIS is not the last_call!
    end

    IO.puts
  end
end

defmodule CredoSampleModule do
  defp print_issue(%Issue{check: check, message: message, filename: filename, priority: priority} = issue, source_file) do
    if issue.column do
      IO.puts "."
    else
 ##Warning: warning_unused_string_operation
      [:this_goes_nowhere, String.duplicate("^", w)] # THIS is not the last_call!
      IO.puts " "
    end
  end
end

defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
 ##Warning: warning_unused_string_operation
    String.split(parameter1)
    parameter1
  end
  def some_function2(parameter1, parameter2) do
 ##Warning: warning_unused_string_operation
   String.trim(parameter1)
   parameter1
   end
   def some_function3(parameter1, parameter2) do
 ##Warning: warning_unused_string_operation
     String.trim(parameter1)
     parameter1
   end
end

defmodule CredoSampleModule do
  defp something(bin) do
    for segment <- String.split(bin, "/"), segment != "" do
 ##Warning: warning_unused_string_operation
      String.upcase(segment)
      segment
    end
  end
end
