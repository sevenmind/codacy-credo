##Patterns: refactor_cond_statements
defmodule CredoSampleModule do
  use ExUnit.Case

  def some_fun do
 ##Info: refactor_cond_statements
    cond do
      x == x -> 0
      true -> 1
    end
  end
end

defmodule CredoSampleModule do
  use ExUnit.Case

  def some_fun do
 ##Info: refactor_cond_statements
    cond do
      x == x -> 0
      true -> 1
    end
 ##Info: refactor_cond_statements
    cond do
      true -> 1
    end
  end
end
