You can use white-space after commas to make items of lists,
tuples and other enumerations easier to separate from one another.

    # preferred

    alias Project.{Alpha, Beta}

    def some_func(first, second, third) do
      list = [1, 2, 3, 4, 5]
      # ...
    end

    # NOT preferred - items are harder to separate

    alias Project.{Alpha,Beta}

    def some_func(first,second,third) do
      list = [1,2,3,4,5]
      # ...
    end

Like all `Readability` issues, this one is not a technical concern.
But you can improve the odds of others reading and liking your code by making
it easier to follow.
