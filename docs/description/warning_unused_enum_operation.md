With the exception of `Enum.each/2`, the result of a call to the
Enum module's functions has to be used.

While this is correct ...

    def prepend_my_username(my_username, usernames) do
      valid_usernames = Enum.reject(usernames, &is_nil/1)

      [my_username] ++ valid_usernames
    end

... we forgot to save the downcased username in this example:

    # This is bad because it does not modify the usernames variable!

    def prepend_my_username(my_username, usernames) do
      Enum.reject(usernames, &is_nil/1)

      [my_username] ++ valid_usernames
    end

Since Elixir variables are immutable, Enum operations never work on the
variable you pass in, but return a new variable which has to be used somehow
(the exception being `Enum.each/2` which iterates a list and returns `:ok`).
