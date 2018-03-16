##Patterns: refactor_unless_with_else
defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
 ##Warning: refactor_unless_with_else
    unless allowed? do
      something
    else
      something_else
    end
  end
end
