##Patterns: design_tag_todo
 ##Info: design_tag_todo
defmodule CredoSampleModule do
  use ExUnit.Case # FIXME: this should not appear in the TODO test

 ##Info: design_tag_todo
  # TODO: this should not appear in the # TODO test

  def some_fun do
    assert x == x + 2
  end
end

defmodule CredoSampleModule do
  @moduledoc """
  FIXME: this should not appear in the test
  """

 ##Info: design_tag_todo
  @doc "TODO: this should yield an issue"

  def some_fun do
    assert x == x + 2
  end
end

defmodule CredoSampleModule do
 ##Info: design_tag_todo
  @moduledoc """
  TODO: this should not appear in the TODO test
  """

  @doc "FIXME: this should yield an issue"

  def some_fun do
    assert x == x + 2
  end
end

defmodule CredoSampleModule do
 ##Info: design_tag_todo
  @shortdoc """
  TODO: this should not appear in the TODO test
  """

  @doc "FIXME: this should yield an issue"

  def some_fun do
    assert x == x + 2
  end
end

defmodule CredoSampleModule do
  use ExUnit.Case # FIXME: this should not appear in the TODO test

 ##Info: design_tag_todo
# TODO: this should appear

  def some_fun do
    assert x == x + 2
  end
end

defmodule CredoSampleModule do
 ##Info: design_tag_todo
  #TODO: this should appear
end

defmodule CredoSampleModule do
 ##Info: design_tag_todo
  #       TODO: this should appear
end

defmodule CredoSampleModule do
 ##Info: design_tag_todo
  # TODO:         this should appear
end

defmodule CredoSampleModule do
  def some_fun do
 ##Info: design_tag_todo
    Repo.preload(:comments)# TODO blah blah
  end
end

defmodule CredoSampleModule do
  def some_fun do
 ##Info: design_tag_todo
    # todo blah blah
    Repo.preload(:comments)
  end
end

defmodule CredoSampleModule do
 ##Info: design_tag_todo
  use ExUnit.Case # TODO: this is the first
  @moduledoc """
    this is an example # TODO: and this is an actual TODO
  """

 ##Info: design_tag_todo
  def some_fun do # TODO this is the second
    x = ~s{also: # TODO: no comment here}
    assert 2 == x
 ##Info: design_tag_todo
    ?" # TODO: this is the third

    "also: # TODO: no comment here as well"
  end
end
