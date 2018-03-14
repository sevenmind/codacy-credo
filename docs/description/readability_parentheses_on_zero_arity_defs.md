Do not use parentheses when defining a function which has no arguments.

The code in this example ...

    def summer?() do
      # ...
    end

... should be refactored to look like this:

    def summer? do
      # ...
    end

Like all `Readability` issues, this one is not a technical concern.
But you can improve the odds of others reading and liking your code by making
it easier to follow.
