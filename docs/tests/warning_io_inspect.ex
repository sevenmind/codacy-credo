##Patterns: warning_io_inspect
defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
    ##Warning: warning_io_inspect
    IO.inspect parameter1 + parameter2
  end
end

defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
    parameter1 + parameter2
    ##Warning: warning_io_inspect
    |> IO.inspect
  end
end

defmodule CredoSampleModule do
  def some_function(a, b, c) do
    ##Warning: warning_io_inspect
    map([a,b,c], &IO.inspect(&1))
  end
end
