##Patterns: design_alias_usage 
 ##Warning: design_alias_usage
defmodule CredoSampleModule do
  def fun1 do
    ExUnit.Case.something
  end
end

defmodule CredoSampleModule do
  alias ExUnit.Case

  def fun1 do
    something
    |> Credo.Foo.Bar.Baz.call
  end
end

defmodule CredoSampleModule do
  alias ExUnit.Case

  def fun1 do
    Credo.Foo.Bar.call
  end

  def fun1 do
    Credo.Foo.Bar.call
  end
end

defmodule Test do
  alias Exzmq.{Socket, Tcp}

  def just_an_example do
    Socket.test1
    Exzmq.Socket.test2
  end
end
