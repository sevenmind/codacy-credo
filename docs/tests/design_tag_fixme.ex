##Patterns: design_tag_fixme
defmodule CredoSampleModule do
  use ExUnit.Case # TODO: this should not appear in the FIXME test

 ##Warning: design_tag_fixme
  # FIXME: this should not appear in the # FIXME test

  def some_fun do
    assert x == x + 2
  end
end

defmodule CredoSampleModule do
  def some_fun do
 ##Warning: design_tag_fixme
    # fixme blah blah
    Repo.preload(:comments)
  end
end

defmodule CredoSampleModule do
 ##Warning: design_tag_fixme
  use ExUnit.Case # FIXME: this is the first
  @moduledoc """
    this is an example # FIXME: and this is no actual comment
  """

 ##Warning: design_tag_fixme
  def some_fun do # FIXME this is the second
    x = ~s{also: # FIXME: no comment here}
    assert 2 == x
 ##Warning: design_tag_fixme
    ?" # FIXME: this is the third

    "also: # FIXME: no comment here as well"
  end
end
