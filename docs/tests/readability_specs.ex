##Patterns: readability_specs
defmodule CredoTypespecTest do
  ##Info: readability_specs
  @spec foo(integer) :: integer
  def foo(a), do: a

  def foo(a, b), do: a + b
end

defmodule CredoTypespecTest do
  ##Info: readability_specs
  @spec foo(integer) :: integer
  def foo(a), do: a

  def foo(a, b), do: a + b
end
