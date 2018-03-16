##Patterns: refactor_nesting
defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
    if parameter1 do
      if parameter2 do
 ##Info: refactor_nesting
        case parameter1 do
          0 -> nil
          1 -> do_something
        end
      end
    end
  end
end

defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
    case parameter1 do
      0 -> nil
      1 ->
        if parameter1 do
 ##Info: refactor_nesting
          if parameter2 do
            do_something
          end
        end
    end
  end
end

defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
    if parameter1 do
      case parameter1 do
        0 -> nil
        1 ->
 ##Info: refactor_nesting
          if parameter2, do: do_something
      end
    end
  end
end

defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
    Enum.reduce(var1, list, fn({_hash, nodes}, list) ->
      filenames = nodes |> Enum.map(&(&1.filename))
      Enum.reduce(list, [], fn(item, acc) ->
 ##Info: refactor_nesting
        if Enum.member?(filenames, item.filename) do
          item # this is nested 3 levels deep
        end
        acc ++ [item]
      end)
    end)
  end
end
