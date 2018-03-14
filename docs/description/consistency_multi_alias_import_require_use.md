When using alias, import, require or use for multiple names from the same
namespace, you have two options:

Use single instructions per name:

  alias Ecto.Query
  alias Ecto.Schema
  alias Ecto.Multi

or use one multi instruction per namespace:

  alias Ecto.{Query, Schema, Multi}

While this is not necessarily a concern for the correctness of your code,
you should use a consistent style throughout your codebase.
