##Patterns: readability_parentheses_in_condition
defmodule Mix.Tasks.Credo do
  def run(argv) do
 ##Warning: readability_parentheses_in_condition
    if( allowed? ) do
      true
    else
      false
    end
  end
end

defmodule Mix.Tasks.Credo do
  def run(argv) do
 ##Warning: readability_parentheses_in_condition
    if (allowed?), do: true
 ##Warning: readability_parentheses_in_condition
    unless (!allowed?), do: true
  end
end

defmodule Mix.Tasks.Credo do
  def run(argv) do
 ##Warning: readability_parentheses_in_condition
    unless( !allowed? ) do
      true
    else
      false
    end
  end
end

defmodule Mix.Tasks.Credo do
  def run(argv) do
 ##Warning: readability_parentheses_in_condition
    if ( allowed? ) do
      true
    else
      false
    end

 ##Warning: readability_parentheses_in_condition
    unless (also_allowed?) do
      true
    end
  end
end
