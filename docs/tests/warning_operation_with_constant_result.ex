##Patterns: warning_operation_with_constant_result 
 ##Warning: warning_operation_with_constant_result
defmodule CredoSampleModule do
  use ExUnit.Case

  def some_fun do
    x * 1
  end
end

defmodule CredoSampleModule do
  use ExUnit.Case

  def some_fun(x, y) do
    x * 1   # always returns x
    x * 0   # always returns 0
  end
end
