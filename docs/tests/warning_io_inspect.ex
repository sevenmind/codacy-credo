##Patterns: warning_io_inspect
defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
    IO.inspect parameter1 + parameter2
    ##Warning: warning_io_inspect
  end
end

defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
    parameter1 + parameter2
    |> IO.inspect
    ##Warning: warning_io_inspect
  end
end

defmodule CredoSampleModule do
  def some_function(a, b, c) do
    map([a,b,c], &IO.inspect(&1))
    ##Warning: warning_io_inspect
  end
end
