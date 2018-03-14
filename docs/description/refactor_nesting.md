Code should not be nested more than once inside a function.

    defmodule CredoSampleModule do
      def some_function(parameter1, parameter2) do
        Enum.reduce(var1, list, fn({_hash, nodes}, list) ->
          filenames = nodes |> Enum.map(&(&1.filename))

          Enum.reduce(list, [], fn(item, acc) ->
            if item.filename do
              item               # <-- this is nested 3 levels deep
            end
            acc ++ [item]
          end)
        end)
      end
    end

At this point it might be a good idea to refactor the code to separate the
different loops and conditions.
