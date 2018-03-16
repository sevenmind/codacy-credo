##Patterns: refactor_function_arity
defmodule Credo.Sample.Module do
 ##Info: refactor_function_arity
  def some_function(p1, p2, p3, p4, p5, p6) do
    some_value = parameter1 + parameter2
  end
end

defmodule Credo.Sample.Module do
 ##Info: refactor_function_arity
  def some_function(p1, p2, p3, p4, p5) do
    some_value = parameter1 + parameter2
  end
end
