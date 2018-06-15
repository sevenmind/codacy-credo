##Patterns: warning_unused_tuple_operation
defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
    x = parameter1 + parameter2

 ##Warning: warning_unused_tuple_operation
    Tuple.delete_at(parameter1, x)

    parameter1
  end
end

defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
    parameter1 + parameter2
 ##Warning: warning_unused_tuple_operation
    |> Tuple.delete_at(parameter1)

    parameter1
  end
end

defmodule CredoSampleModule do
  defp print_issue(%Issue{check: check, message: message, filename: filename, priority: priority} = issue, source_file) do
    if issue.column do
      [
        :this_goes_nowhere,
 ##Warning: warning_unused_tuple_operation
        Tuple.to_list(w, ",") # THIS is not the last_call!
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
 ##Warning: warning_unused_tuple_operation
      Tuple.to_list(filename)
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
 ##Warning: warning_unused_tuple_operation
          Tuple.insert_at(arr, [], fn(w) ->
            [:this_goes_nowhere, Tuple.to_list(w, ",")]
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
 ##Warning: warning_unused_tuple_operation
      [:this_goes_nowhere, Tuple.to_list(w, ",")] # THIS is not the last_call!
    end

    IO.puts
  end
end

defmodule CredoSampleModule do
  defp print_issue(%Issue{check: check, message: message, filename: filename, priority: priority} = issue, source_file) do
    if issue.column do
      IO.puts "."
    else
     ##Warning: warning_unused_tuple_operation
      [:this_goes_nowhere, Tuple.to_list(w, ",")] # THIS is not the last_call!
      IO.puts " "
    end
  end
end

defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
 ##Warning: warning_unused_tuple_operation
    Tuple.insert_at(parameter1, [], &is_nil/1)
    parameter1
  end
  def some_function2(parameter1, parameter2) do
 ##Warning: warning_unused_tuple_operation
   Tuple.insert_at(parameter1, [], parameter2)
   parameter1
   end
   def some_function3(parameter1, parameter2) do
 ##Warning: warning_unused_tuple_operation
     Tuple.insert_at(parameter1, [], parameter2)
     parameter1
   end
end

defmodule CredoSampleModule do
  defp something(bin) do
    for segment <- Tuple.append(segment1, 1), segment != "" do
 ##Warning: warning_unused_tuple_operation
      Tuple.insert_at(segment, 1, [:added_to_the_tail])
      segment
    end
  end
end
