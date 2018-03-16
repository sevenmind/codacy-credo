##Patterns: warning_lazy_logging
defmodule CredoSampleModule do

  def some_function(parameter1, parameter2) do
    var_1 = "Hello world"
 ##Warning: warning_lazy_logging
    Logger.debug "The module: #{var1}"
 ##Warning: warning_lazy_logging
    Logger.debug "The module: #{var1}"
 ##Warning: warning_lazy_logging
    Logger.debug "The module: #{var1}"
  end
end

defmodule CredoSampleModule do
  import Logger

  def some_function(parameter1, parameter2) do
 ##Warning: warning_lazy_logging
    debug "Ok #{inspect 1}"
  end
end
