An `if` block with a negated condition should not contain an else block.

So while this is fine:

    if !allowed? do
      raise "Not allowed!"
    end

The code in this example ...

    if !allowed? do
      raise "Not allowed!"
    else
      proceed_as_planned()
    end

... should be refactored to look like this:

    if allowed? do
      proceed_as_planned()
    else
      raise "Not allowed!"
    end

The reason for this is not a technical but a human one. It is easier to wrap
your head around a positive condition and then thinking "and else we do ...".

In the above example raising the error in case something is not allowed
might seem so important to put it first. But when you revisit this code a
while later or have to introduce a colleague to it, you might be surprised
how much clearer things get when the "happy path" comes first.
