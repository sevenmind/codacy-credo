Because `if` and `unless` are macros, the preferred style is to not use
parentheses around conditions.

    # preferred

    if valid?(username) do
      # ...
    end

    # NOT preferred

    if( valid?(username) ) do
      # ...
    end

Like all `Readability` issues, this one is not a technical concern.
But you can improve the odds of others reading and liking your code by making
it easier to follow.
