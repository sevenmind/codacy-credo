Pipes (`|>`) can become more readable by starting with a "raw" value.

So while this is easily comprehendable:

    list
    |> Enum.take(5)
    |> Enum.shuffle
    |> pick_winner()

This might be harder to read:

    Enum.take(list, 5)
    |> Enum.shuffle
    |> pick_winner()

As always: This is just a suggestion. Check the configuration options for
tweaking or disabling this check.
