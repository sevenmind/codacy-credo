An `unless` block should not contain an else block.

So while this is fine:

    unless allowed? do
      raise "Not allowed!"
    end

This should be refactored:

    unless allowed? do
      raise "Not allowed!"
    else
      proceed_as_planned()
    end

to look like this:

    if allowed? do
      proceed_as_planned()
    else
      raise "Not allowed!"
    end

The reason for this is not a technical but a human one. The `else` in this
case will be executed when the condition is met, which is the opposite of
what the wording seems to apply.
