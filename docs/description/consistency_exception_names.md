Exception names should end with a common suffix like "Error".

Try to name your exception modules consistently:

    defmodule BadCodeError do
      defexception [:message]
    end

    defmodule ParserError do
      defexception [:message]
    end

Inconsistent use should be avoided:

    defmodule BadHTTPResponse do
      defexception [:message]
    end

    defmodule HTTPHeaderException do
      defexception [:message]
    end

While this is not necessarily a concern for the correctness of your code,
you should use a consistent style throughout your codebase.
