When capturing a parameter using pattern matching you can either put the name before or after the value
i.e.

  def parse({:ok, values} = pair)

or

  def parse(pair = {:ok, values})

While this is not necessarily a concern for the correctness of your code,
you should use a consistent style throughout your codebase.
