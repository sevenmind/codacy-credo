##Patterns: refactor_append_single_item
defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
##Info: refactor_append_single_item
    parameter1 ++ [parameter2]
  end
end
