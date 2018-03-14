Names assigned to parameters of a named function should not be the same as
names of functions in the same module or in `Kernel`.

Example:

    def handle_something(date, time) do
      time  # not clear if we are talking about time/0 or time
    end

    def time do
      TimeHelper.now
    end

This might not seem like a big deal, especially for small functions.
But there is no downside to avoiding it, especially in the case of functions
with arity `/0` and Kernel functions.

True story: You might pattern match on a parameter geniusly called `node`.
Then you remove that match for some reason and rename the parameter to `_node`
because it is no longer used.
Later you reintroduce the pattern match on `node` but forget to also rename
`_node` and suddenly the match is actually against `Kernel.node/0` and has the
weirdest side effects.

This happens. I mean, to a friend of mine, it did. Who ... later told me.
