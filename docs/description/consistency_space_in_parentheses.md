Don't use spaces after `(`, `[`, and `{` or before `}`, `]`, and `)`. This is
the **preferred** way, although other styles are possible, as long as it is
applied consistently.

    # preferred

    Helper.format({1, true, 2}, :my_atom)

    # also okay

    Helper.format( { 1, true, 2 }, :my_atom )

While this is not necessarily a concern for the correctness of your code,
you should use a consistent style throughout your codebase.
