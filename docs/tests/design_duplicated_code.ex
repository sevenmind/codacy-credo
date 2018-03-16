##Patterns: design_duplicated_code
defmodule M1 do
  mod_fun "something is duplicated" do
    if p1 == p2 do
      p1
    else
      p2 + p1
      if p1 == p2 do
        p1
      else
        p2 + p1
      end
    end
  end

  def myfun(p1, p2) when is_list(p2) do
    if p1 == p2 do
      p1
    else
      p2 + p1
    end
  end
end

defmodule M2 do
  mod_fun "something is duplicated" do
 ##Error: design_duplicated_code
    if p1 == p2 do
      p1
    else
      p2 + p1
      if p1 == p2 do
        p1
      else
        p2 + p1
      end
    end
  end

  def myfun(p1, p2) when is_list(p2) do
    if p1 == p2 do
      p1
    else
      p2 + p1
    end
  end
end
