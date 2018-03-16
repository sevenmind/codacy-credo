##Patterns: warning_unused_regex_operation 
 ##Warning: warning_unused_regex_operation
defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
    x = parameter1 + parameter2

    Regex.delete_at(parameter1, x)

    parameter1
  end
end

defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
    parameter1 + parameter2
    |> Regex.delete_at(parameter1)

    parameter1
  end
end

defmodule CredoSampleModule do
  defp print_issue(%Issue{check: check, message: message, filename: filename, priority: priority} = issue, source_file) do
    if issue.column do
      [
        :this_goes_nowhere,
        Regex.compile!(w, ",") # THIS is not the last_call!
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
      Regex.compile!(filename)
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
          Regex.insert_at(arr, [], fn(w) ->
            [:this_goes_nowhere, Regex.compile!(w, ",")]
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
      [:this_goes_nowhere, Regex.compile!(w, ",")] # THIS is not the last_call!
    end

    IO.puts
  end
end

defmodule CredoSampleModule do
  defp print_issue(%Issue{check: check, message: message, filename: filename, priority: priority} = issue, source_file) do
    if issue.column do
      IO.puts "."
    else
      [:this_goes_nowhere, Regex.compile!(w, ",")] # THIS is not the last_call!
      IO.puts " "
    end
  end
end

defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
    Regex.insert_at(parameter1, [], &is_nil/1)
    parameter1
  end
  def some_function2(parameter1, parameter2) do
   Regex.insert_at(parameter1, [], parameter2)
   parameter1
   end
   def some_function3(parameter1, parameter2) do
     Regex.insert_at(parameter1, [], parameter2)
     parameter1
   end
end

defmodule CredoSampleModule do
  defp something(bin) do
    for segment <- Regex.append(segment1, 1), segment != "" do
      Regex.insert_at(segment, 1, [:added_to_the_tail])
      segment
    end
  end
end
