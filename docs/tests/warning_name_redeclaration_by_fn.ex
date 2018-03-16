##Patterns: warning_name_redeclaration_by_fn 
 ##Warning: warning_name_redeclaration_by_fn
defmodule CredoSampleModule do
  def fun1(p1) do
    Enum.map(p1, fn
      {a, a} ->
        IO.inspect a
      {x, fun2} ->
        IO.inspect fun2       # now the variable is used instead of the function
    end)
  end

  def fun2 do
    42
  end
end
