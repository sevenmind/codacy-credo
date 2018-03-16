##Patterns: refactor_variable_rebinding
 ##Info: refactor_variable_rebinding
defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
    a = 1
 ##Info: refactor_variable_rebinding
    a = 2
  end
end

defmodule CredoSampleModule do
  def some_function() do
    var_1 = 1 + 3
    var_b = var_1 + 7
 ##Info: refactor_variable_rebinding
    var_1 = 34
    var_c = 2456
 ##Info: refactor_variable_rebinding
    var_b = 2
  end
end

defmodule CredoSampleModule do
  def some_function() do
    something = "ABABAB"
 ##Info: refactor_variable_rebinding
    {:ok, something} = Base.decode16(something)
 ##Info: refactor_variable_rebinding
    {a, a} = {2, 2} # this should _not_ trigger it
  end
end

defmodule CredoSampleModule do
  def some_function() do
 ##Info: refactor_variable_rebinding
    {a = b, a = b} = {1, 2}
 ##Info: refactor_variable_rebinding
    b = 2
  end
end

defmodule CredoSampleModule do
  def some_function() do
    [a, b] = [1, 2]
 ##Info: refactor_variable_rebinding
    b = 2
  end
end

defmodule CredoSampleModule do
  def some_function(opts) do
    %{a: foo, b: bar} = opts
 ##Info: refactor_variable_rebinding
    bar = 3
  end
end
