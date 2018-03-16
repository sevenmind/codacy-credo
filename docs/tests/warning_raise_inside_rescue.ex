##Patterns: warning_raise_inside_rescue 
 ##Info: warning_raise_inside_rescue
defmodule CredoSampleModule do
  use ExUnit.Case

  def catcher do
    try do
      raise "oops"
    rescue
      e in RuntimeError ->
        Logger.warn("Something bad happened")
        raise e
    end
  end
end

defmodule CredoSampleModule do
  use ExUnit.Case

  def catcher do
    raise "oops"
  rescue
    e in RuntimeError ->
      Logger.warn("Something bad happened")
      raise e
  end
end

defmodule CredoSampleModule do
  use ExUnit.Case

  def catcher do
    try do
      raise "oops"
    rescue
      e -> Logger.warn("Something bad happened") && raise e
    end
  end
end
