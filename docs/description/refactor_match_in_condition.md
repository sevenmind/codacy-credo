Pattern matching should only ever be used for simple assignments
inside `if` and `unless` clauses.

While this fine:

    # okay, simple wildcard assignment:

    if contents = File.read!("foo.txt") do
      do_something()
    end

the following should be avoided, since it mixes a pattern match with a
condition and do/else blocks.

    # considered too "complex":

    if {:ok, contents} = File.read("foo.txt") do
      do_something()
    end

    # also considered "complex":

    if allowed? && ( contents = File.read!("foo.txt") ) do
      do_something()
    end

If you want to match for something and execute another block otherwise,
consider using a `case` statement:

    case File.read("foo.txt") do
      {:ok, contents} ->
        do_something()
      _ ->
        do_something_else()
    end

