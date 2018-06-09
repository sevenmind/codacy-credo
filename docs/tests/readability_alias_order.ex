##Patterns: readability_alias_order
##Issue: {"severity": "Info", "line": 16, "patternId": "readability_alias_order"}  
defmodule CredoSampleModule do
  alias App.CLI.{Bar, Baz}

  alias App.Foo.{
    Sorter,
##Info: readability_alias_order
    Command,
    Filename
  }

  alias Credo.CLI.Command
  alias Credo.CLI.Filename
  alias Credo.CLI.Sorter
  alias App.Module1
  alias App.Module2
end
