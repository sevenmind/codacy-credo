##Patterns: consistency_parameter_pattern_matching
defmodule Credo.Sample do
  defmodule InlineModule do
    def list_after([bar, baz] = foo), do: :ok

 ##Warning: consistency_parameter_pattern_matching
    def struct_before(foo_left = %User{name: name}), do: :ok
    def struct_after(%User{name: name} = foo), do: :ok

 ##Warning: consistency_parameter_pattern_matching
    defp map_before(foo_left = %{bar: baz}), do: :ok
    defp map_after(%{bar: baz} = foo), do: :ok
  end
end
