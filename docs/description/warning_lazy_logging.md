Ensures laziness of Logger calls.

You will want to wrap expensive logger calls into a zero argument
function (`fn -> "string that gets logged" end`).

Example:

    # preferred

    Logger.debug fn ->
      "This happened: #{expensive_calculation(arg1, arg2)}"
    end

    # NOT preferred
    # the interpolation is executed whether or not the info is logged

    Logger.debug "This happened: #{expensive_calculation(arg1, arg2)}"
