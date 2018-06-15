##Patterns: readability_variable_names
defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
 ##Warning: readability_variable_names
    someValue = parameter1 + parameter2
  end
end

defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
 ##Warning: readability_variable_names
    someOtherValue = parameter1 + parameter2
  end
end

defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
 ##Warning: readability_variable_names
    {true, someValue} = parameter1
  end
end

defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
 ##Warning: readability_variable_names
    [1, someValue] = parameter1
  end
end

defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
 ##Warning: readability_variable_names
    [someValue | tail] = parameter1
  end
end

defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
 ##Warning: readability_variable_names
    "e" <> someValue = parameter1
  end
end

defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
 ##Warning: readability_variable_names
    ^someValue = parameter1
  end
end

defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
 ##Warning: readability_variable_names
    %{some_value: someValue} = parameter1
  end
end

defmodule CredoSampleModule do
  def some_function(parameter1, parameter2) do
 ##Warning: readability_variable_names
 ##Warning: readability_variable_names
    %{some_value: someValue, other_value: otherValue} = parameter1
  end
end
