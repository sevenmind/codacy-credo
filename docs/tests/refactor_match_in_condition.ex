##Patterns: refactor_match_in_condition
 ##Info: refactor_match_in_condition
defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
    if {:ok, value} = parameter1 do
      do_something
    end
  end
end

defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
    if String.match?(name, ~r/^[a-z]/) do
      mod_name = names |> Enum.slice(0..length(names) - 2) |> Enum.join(".")
      mod_prio = lookup[mod_name]
      if {:ok, value} = parameter1 do         # <-- this one should be found
        do_something
      end
    else
      {scope_name, prio}
    end
  end
end

defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
 ##Info: refactor_match_in_condition
    if( {:ok, value} = parameter1 ) do
      do_something
    end
  end
end

defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
    unless {:ok, value} = parameter1 do
      do_something
    end
  end
end

defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
    if !is_nil(baz = Map.get(foo, :bar)), do: baz
  end
end

defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
    if allowed? && !is_nil(baz = Map.get(foo, :bar)) do
      baz
    end
  end
end

defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
    unless !(x = Map.get(foo, :bar)), do: x
  end
end
