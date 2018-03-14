Unless blocks should not contain a negated condition.

The code in this example ...

    unless !allowed? do
      proceed_as_planned()
    end

... should be refactored to look like this:

    if allowed? do
      proceed_as_planned()
    end

The reason for this is not a technical but a human one. It is pretty difficult
to wrap your head around a block of code that is executed if a negated
condition is NOT met. See what I mean?
