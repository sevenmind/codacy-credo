##Patterns: refactor_negated_conditions_in_unless
defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
 ##Warning: refactor_negated_conditions_in_unless
    unless !allowed? do
      something
    end
  end
end
