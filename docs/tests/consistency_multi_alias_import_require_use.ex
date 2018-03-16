##Patterns: consistency_multi_alias_import_require_use
defmodule Credo.Sample2 do
  alias Foo.Bar
  alias Foo.Quux
  require Foo.Bar
end

defmodule Credo.Sample3 do
  alias Foo.{Bar, Quux}
  alias Bar.{Baz, Bang}
 ##Warning: consistency_multi_alias_import_require_use
  alias Foo.Bar
 ##Warning: consistency_multi_alias_import_require_use
  require Foo.Quux
end
