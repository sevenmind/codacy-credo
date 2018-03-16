##Patterns: readability_space_after_commas
defmodule CredoSampleModule do
 ##Info: readability_space_after_commas
  @attribute {:foo,:bar}
end

defmodule CredoSampleModule do
 ##Info: readability_space_after_commas
  @attribute [1,2,"three",4,5]
end

defmodule CredoSampleModule do
 ##Info: readability_space_after_commas
  @some_char_codes [?,,?;]
end

defmodule CredoSampleModule do
 ##Info: readability_space_after_commas
  @attribute [question?,answer]
end

defmodule CredoSampleModule do
 ##Info: readability_space_after_commas
  @attribute [foo,[bar]]
end
