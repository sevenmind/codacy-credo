##Patterns: warning_map_get_unsafe_pass
 ##Warning: warning_map_get_unsafe_pass
defmodule CredoSampleModule do
  def some_function() do

    %{}
 ##Warning: warning_map_get_unsafe_pass
    |> Map.get(:foo)
    |> Enum.sum

  end
end

defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
    some_map = %{}

 ##Warning: warning_map_get_unsafe_pass
    Map.get(some_map, :items)
    |> Enum.map(fn x -> x["id"] end)

  end
end

defmodule CredoSampleModule do
  def some_function(a, b, c) do

    a
    |> Enum.map(fn x ->
                  x
 ##Warning: warning_map_get_unsafe_pass
                  |> Map.get(b)
                  |> Enum.reduce([], &some_fun/1)
                end)
    |> some_other_function(c)

  end
end
