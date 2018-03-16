##Patterns: warning_bool_operation_on_same_values
 ##Warning: warning_bool_operation_on_same_values
defmodule CredoSampleModule do
  use ExUnit.Case

  def some_fun do
 ##Warning: warning_bool_operation_on_same_values
    x and x
 ##Warning: warning_bool_operation_on_same_values
    x or x
    x && x
    x || x
    x &&
      x # on different lines
  end
end
