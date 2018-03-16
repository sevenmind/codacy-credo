##Patterns: warning_expensive_empty_enum_check
defmodule CredoSampleModule do
  def some_function(some_list) do
 ##Warning: warning_expensive_empty_enum_check
    if length(some_list) == 0 do
      "empty"
    else
      "not empty"
    end
  end
end

defmodule CredoSampleModule do
  def some_function(some_list) do
 ##Warning: warning_expensive_empty_enum_check
    if 0 == length(some_list) do
      "empty"
    else
      "not empty"
    end
  end
end

defmodule CredoSampleModule do
  def some_function(enum) do
 ##Warning: warning_expensive_empty_enum_check
    if Enum.count(some_list) == 0 do
      "empty"
    else
      "not empty"
    end
  end
end

defmodule CredoSampleModule do
  def some_function(enum) do
 ##Warning: warning_expensive_empty_enum_check
    if 0 == Enum.count(enum) do
      "empty"
    else
      "not empty"
    end
  end
end
