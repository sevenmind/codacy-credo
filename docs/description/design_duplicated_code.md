Code should not be copy-pasted in a codebase when there is room to abstract
the copied functionality in a meaningful way.

That said, you should by no means "ABSTRACT ALL THE THINGS!".

Sometimes it can serve a purpose to have code be explicit in two places, even
if it means the snippets are nearly identical. A good example for this are
Database Adapters in a project like Ecto, where you might have nearly
identical functions for things like `order_by` or `limit` in both the
Postgres and MySQL adapters.

In this case, introducing an `AbstractAdapter` just to avoid code duplication
might cause more trouble down the line than having a bit of duplicated code.

Like all `Software Design` issues, this is just advice and might not be
applicable to your project/situation.
