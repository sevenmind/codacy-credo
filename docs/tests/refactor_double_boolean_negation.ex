
##Patterns: refactor_double_boolean_negation
defmodule CredoSampleMod do
  def run do
##Info: refactor_double_boolean_negation
  !!true

##Info: refactor_double_boolean_negation
  !!!true

##Info: refactor_double_boolean_negation
  !!!!true

##Info: refactor_double_boolean_negation
  not not true
  end
end
