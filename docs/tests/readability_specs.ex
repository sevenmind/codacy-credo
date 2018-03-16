##Patterns: readability_specs
defmodule CredoTypespecTest do
  @spec foo(integer) :: integer
  def foo(a), do: a

  ##Info: readability_specs
  def foo(a, b), do: a + b
end

defmodule CredoTypespecTest do
  @spec foo(integer) :: integer
  def foo(a), do: a

  ##Info: readability_specs
  def foo(a, b), do: a + b
end
