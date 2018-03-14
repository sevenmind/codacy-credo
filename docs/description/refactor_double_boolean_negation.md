Having double negations in your code obscures a parameters original value.

    # NOT preferred

    !!var

This will return `false` for `false` and `nil`, and `true` for anything else.

At first this seems like an extra clever shorthand to cast anything truthy to
`true` and anything non-truthy to `false`. But in most scenarios you want to
be explicit about your input parameters (because it is easier to reason about
edge-cases, code-paths and tests).
Also: `nil` and `false` do mean two different things.

A scenario where you want this kind of flexibility, however, is parsing
external data, e.g. a third party JSON-API where a value is sometimes `null`
and sometimes `false` and you want to normalize that before handing it down
in your program.

In these case, you would be better off making the cast explicit by introducing
a helper function:

    # preferred

    defp present?(nil), do: false
    defp present?(false), do: false
    defp present?(_), do: true

This makes your code more explicit than relying on the implications of `!!`.
