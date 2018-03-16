##Patterns: warning_name_redeclaration_by_case
defmodule CredoSampleModule do
  def fun1 do
    case xyz do
 ##Warning: warning_name_redeclaration_by_case
      fun2 -> fun2 # now the variable is used instead of the function
      %{something: foobar} -> foobar
    end
  end

  defmacro fun2 do
    42
  end
end

defmodule CredoSampleModule do
  def fun1 do
    case xyz do
      x -> x
 ##Warning: warning_name_redeclaration_by_case
      %{something: fun2} -> foobar # now the variable is used instead of the function
    end
  end

  defmacro fun2 do
    42
  end
end

defmodule CredoSampleModule do
  def fun1(param1) do
    case param1 do
 ##Warning: warning_name_redeclaration_by_case
      fun2 -> 5 # now the variable is used instead of the function
      _ -> 6
    end
  end

  def fun2 do
    42
  end
end
