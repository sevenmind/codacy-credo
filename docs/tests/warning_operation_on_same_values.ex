##Patterns: warning_operation_on_same_values 
 ##Warning: warning_operation_on_same_values
defmodule CredoSampleModule do
  use ExUnit.Case

  def some_fun do
    assert x == x
  end
end

defmodule CredoSampleModule do
  use ExUnit.Case
  @a 5
  @some_module_attribute @a - @a
end

defmodule CredoSampleModule do
  use ExUnit.Case

  def some_fun do
    x == x  # always true
    x >= x  # always false
    x <= x  # always false
    x != x  # always false
    x > x   # always false
    y / y   # always 1
    y - y   # always 0
    y -
      y # on different lines
    y - y + x
  end
end
