##Patterns: consistency_multi_alias_import_require_use
 ##Warning: consistency_multi_alias_import_require_use
defmodule Credo.Sample2 do
  alias Foo.Bar
  alias Foo.Quux
  require Foo.Bar
end

 ##Warning: consistency_multi_alias_import_require_use
defmodule Credo.Sample3 do
  alias Foo.{Bar, Quux}
  alias Bar.{Baz, Bang}
  alias Foo.Bar
  require Foo.Quux
end
