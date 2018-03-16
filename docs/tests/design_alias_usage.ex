##Patterns: design_alias_usage
defmodule CredoSampleModule do
  def fun1 do
 ##Warning: design_alias_usage
    ExUnit.Case.something
  end
end

defmodule CredoSampleModule do
  alias ExUnit.Case

  def fun1 do
    something
 ##Warning: design_alias_usage
    |> Credo.Foo.Bar.Baz.call
  end
end

defmodule CredoSampleModule do
  alias ExUnit.Case

  def fun1 do
 ##Warning: design_alias_usage
    Credo.Foo.Bar.call
  end

  def fun1 do
 ##Warning: design_alias_usage
    Credo.Foo.Bar.call
  end
end

defmodule Test do
  alias Exzmq.{Socket, Tcp}

  def just_an_example do
    Socket.test1
 ##Warning: design_alias_usage
    Exzmq.Socket.test2
  end
end
