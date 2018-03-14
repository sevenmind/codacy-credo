Prefer using an implicit `try` rather than explicit `try` if you try to rescue
anything the function does.

For example, this:

    def failing_function(first) do
      try do
        to_string(first)
      rescue
        _ -> :rescued
      end
    end

Can be rewritten without `try` as below:

    def failing_function(first) do
      to_string(first)
    rescue
      _ -> :rescued
    end

Like all `Readability` issues, this one is not a technical concern.
The code will behave identical in both ways.
