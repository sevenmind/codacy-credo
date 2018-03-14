Functions, callbacks and macros need typespecs.

Adding typespecs allows tools like dialyzer to perform success typing on
functions. Without a spec functions and macros are ignored by the type
checker.

    @spec add(integer, integer) :: integer
    def add(a, b), do: a + b

Functions with multiple arities need to have a spec defined for each arity:

    @spec foo(integer) :: boolean
    @spec foo(integer, integer) :: boolean
    def foo(a), do: a > 0
    def foo(a, b), do: a > b

The check only considers whether the specification is present, it doesn't
perform any actual type checking.
