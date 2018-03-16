##Patterns: warning_operation_on_same_values
defmodule CredoSampleModule do
  use ExUnit.Case

  def some_fun do
 ##Warning: warning_operation_on_same_values
    assert x == x
  end
end

defmodule CredoSampleModule do
  use ExUnit.Case
  @a 5
 ##Warning: warning_operation_on_same_values
  @some_module_attribute @a - @a
end

defmodule CredoSampleModule do
  use ExUnit.Case

  def some_fun do
 ##Warning: warning_operation_on_same_values
    x == x  # always true
 ##Warning: warning_operation_on_same_values
    x >= x  # always false
 ##Warning: warning_operation_on_same_values
    x <= x  # always false
 ##Warning: warning_operation_on_same_values
    x != x  # always false
 ##Warning: warning_operation_on_same_values
    x > x   # always false
 ##Warning: warning_operation_on_same_values
    y / y   # always 1
 ##Warning: warning_operation_on_same_values
    y - y   # always 0
 ##Warning: warning_operation_on_same_values
    y -
      y # on different lines
 ##Warning: warning_operation_on_same_values
    y - y + x
  end
end
