Checking if the size of the enum is `0` can be very expensive, since you are
determining the exact count of elements.

Checking if an enum is empty should be done by using

  Enum.empty?(enum)

or

  list == []

