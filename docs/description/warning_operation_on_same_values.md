Operations on the same values always yield the same result and therefore make
little sense in production code.

Examples:

    x == x  # always returns true
    x <= x  # always returns true
    x >= x  # always returns true
    x != x  # always returns false
    x > x   # always returns false
    y / y   # always returns 1
    y - y   # always returns 0

In practice they are likely the result of a debugging session or were made by
mistake.
