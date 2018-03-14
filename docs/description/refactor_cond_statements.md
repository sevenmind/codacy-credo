Each cond statement should have 3 or more statements including the
"always true" statement. Otherwise an `if` and `else` construct might be more
appropriate.

Example:

  cond do
    x == y -> 0
    true -> 1
  end

  # should be written as

  if x == y do
    0
  else
    1
  end

