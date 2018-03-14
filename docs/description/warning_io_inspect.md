While calls to IO.inspect might appear in some parts of production code,
most calls to this function are added during debugging sessions.

This check warns about those calls, because they might have been committed
in error.
