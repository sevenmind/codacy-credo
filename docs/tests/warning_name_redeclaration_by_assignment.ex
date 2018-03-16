##Patterns: warning_name_redeclaration_by_assignment
defmodule CredoSampleModule do
  def fun1 do
    case xyz do
      x -> x
      %{something: foobar} -> foobar
    end
 ##Warning: warning_name_redeclaration_by_assignment
    [fun2, b, 42] = xyz # now the variable is used instead of the function
    %{a: a, b: b, c: false} = fun2
    %SomeModule{a: a, b: b, c: false} = fun2

    fun2 + 1
  end

  defmacro fun2 do
    42
  end
end

defmodule CredoSampleModule do
  def fun1 do
    case xyz do
      x -> x
      %{something: foobar} -> foobar
    end
    [a, b, 42] = fun2
 ##Warning: warning_name_redeclaration_by_assignment
    %{a: fun2, b: b, c: false} = xyz # now the variable is used instead of the function
    %SomeModule{a: a, b: b, c: false} = fun2

    fun2 + 1
  end

  defmacro fun2 do
    42
  end
end

defmodule CredoSampleModule do
  def fun1 do
    case xyz do
      x -> x
      %{something: foobar} -> foobar
    end
    [a, b, 42] = fun2
 ##Warning: warning_name_redeclaration_by_assignment
    %{"a" => fun2, "c" => false} = xyz # now the variable is used instead of the function
    %SomeModule{a: a, b: b, c: false} = fun2

    fun2 + 1
  end

  defmacro fun2 do
    42
  end
end

defmodule CredoSampleModule do
  def fun1 do
    case xyz do
      x -> x
      %{something: foobar} -> foobar
    end
    [a, b, 42] = fun2
    %{a: a, b: b, c: false} = fun2
 ##Warning: warning_name_redeclaration_by_assignment
    %SomeModule{a: fun2, b: b, c: false} = xyz # now the variable is used instead of the function

    fun2 + 1
  end

  defmacro fun2 do
    42
  end
end

defmodule CredoSampleModule do
  def fun1 do
 ##Warning: warning_name_redeclaration_by_assignment
    [{fun2, 2, b, 42}] = xyz # now the variable is used instead of the function
  end

  defmacro fun2 do
    42
  end
end

defmodule CredoSampleModule do
  def fun1 do
 ##Warning: warning_name_redeclaration_by_assignment
    fun2 = 5
    fun2 + 1 # now the variable is used instead of the function
  end

  def fun2 do
    42
  end
end

defmodule CredoSampleModule do
  def fun1 do
 ##Warning: warning_name_redeclaration_by_assignment
    fun2 = 5
 ##Warning: warning_name_redeclaration_by_assignment
    fun3 = 5
    fun2 + fun3 # now the variables are used instead of the functions
  end

  def fun2 do
    42
  end

  defp fun3 do
    42
  end
end
