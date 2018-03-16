##Patterns: warning_unused_keyword_operation 
 ##Warning: warning_unused_keyword_operation
defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
    x = parameter1 + parameter2

    Keyword.take(parameter1, x)

    parameter1
  end
end

defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
    parameter1 + parameter2
    |> Keyword.take(parameter1)

    parameter1
  end
end

defmodule CredoSampleModule do
  defp print_issue(%Issue{check: check, message: message, filename: filename, priority: priority} = issue, source_file) do
    if issue.column do
      [
        :this_goes_nowhere,
        Keyword.values(w, ",") # THIS is not the last_call!
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
      Keyword.new(filename)
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
          Keyword.update(arr, [], fn(w) ->
            [:this_goes_nowhere, Keyword.values(w, ",")]
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
      [:this_goes_nowhere, Keyword.values(w)] # THIS is not the last_call!
    end

    IO.puts
  end
end

defmodule CredoSampleModule do
  defp print_issue(%Issue{check: check, message: message, filename: filename, priority: priority} = issue, source_file) do
    if issue.column do
      IO.puts "."
    else
      [:this_goes_nowhere, Keyword.values(w)] # THIS is not the last_call!
      IO.puts " "
    end
  end
end

defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
    Keyword.update(parameter1, [], &is_nil/1)
    parameter1
  end
  def some_function2(parameter1, parameter2) do
   Keyword.update(parameter1, [], parameter2)
   parameter1
   end
   def some_function3(parameter1, parameter2) do
     Keyword.update(parameter1, [], parameter2)
     parameter1
   end
end

defmodule CredoSampleModule do
  defp something(bin) do
    for segment <- Keyword.has_key?(segment1, 1), segment != "" do
      Keyword.split(segment, [:split_me])
      segment
    end
  end
end
