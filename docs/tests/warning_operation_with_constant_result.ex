##Patterns: warning_operation_with_constant_result
defmodule CredoSampleModule do
  use ExUnit.Case

  def some_fun do
 ##Warning: warning_operation_with_constant_result
    x * 1
  end
end

defmodule CredoSampleModule do
  use ExUnit.Case

  def some_fun(x, y) do
 ##Warning: warning_operation_with_constant_result
    x * 1   # always returns x
 ##Warning: warning_operation_with_constant_result
    x * 0   # always returns 0
  end
end
