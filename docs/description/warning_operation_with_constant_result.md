Operations on the same values always yield the same result and therefore make
little sense in production code.

Examples:

    x * 1   # always returns x
    x * 0   # always returns 0

In practice they are likely the result of a debugging session or were made by
mistake.
