##Patterns: refactor_negated_conditions_with_else
defmodule Mix.Tasks.Credo do
  def run(argv) do
 ##Warning: refactor_negated_conditions_with_else
    if !allowed? do
      true
    else
      false
    end
  end
end

defmodule Mix.Tasks.Credo do
  def run(argv) do
 ##Warning: refactor_negated_conditions_with_else
    if (!allowed?) do
      true
    else
      false
    end
  end
end
