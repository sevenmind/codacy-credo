##Patterns: warning_i_ex_pry
defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
    x = parameter1 + parameter2
 ##Warning: warning_i_ex_pry
    IEx.pry
  end
end
