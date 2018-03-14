If you used quoted strings that contain quotes, you might want to consider
switching to the use of sigils instead.

    # okay

    "<a href=\"http://elixirweekly.net\">#\{text}</a>"

    # not okay, lots of escaped quotes

    "<a href=\"http://elixirweekly.net\" target=\"_blank\">#\{text}</a>"

    # refactor to

    ~S(<a href="http://elixirweekly.net" target="_blank">#\{text}</a>)

This allows us to remove the noise which results from the need to escape
quotes within quotes.
