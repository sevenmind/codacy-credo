##Patterns: readability_max_line_length
defmodule CredoSampleModule do
  use ExUnit.Case

  def some_fun do
##Info: readability_max_line_length
    assert 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 11 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 == 2
  end
end

defmodule CredoSampleModule2 do
  use ExUnit.Case

  def some_fun do
##Info: readability_max_line_length
    assert "1" <> "1" <> "1" <> "1" <> "1" <> "1" <> "1" <> "1" <> "1" <> "1" <> "1" <> "1" <> "1" <> "1" <>  "1" <> "1" <> "1" <> "1" <> "1" <> "1" <> "1" <> "1" <> "1" <> "1" <> "1" <> "1" <> "1" <> "1" == "2"
  end
end
