Alphabetically ordered lists are more easily scannable by the read.

    # preferred

    alias ModuleA
    alias ModuleB
    alias ModuleC

    # NOT preferred

    alias ModuleA
    alias ModuleC
    alias ModuleB

Alias should be alphabetically ordered among their group:

    # preferred

    alias ModuleC
    alias ModuleD

    alias ModuleA
    alias ModuleB

    # NOT preferred

    alias ModuleC
    alias ModuleD

    alias ModuleB
    alias ModuleA

Like all `Readability` issues, this one is not a technical concern.
But you can improve the odds of others reading and liking your code by making
it easier to follow.
