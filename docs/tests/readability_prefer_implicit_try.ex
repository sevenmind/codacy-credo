##Patterns: readability_prefer_implicit_try
 ##Info: readability_prefer_implicit_try
defmodule ModuleWithExplicitTry do
  @moduledoc ""
  def failing_function(first) do
##Info: readability_prefer_implicit_try
    try do
      to_string(first)
    rescue
      _ -> :rescued
    end
  end
end

defmodule ModuleWithExplicitTryZ do
  @moduledoc ""
  defp failing_function(first) do
##Info: readability_prefer_implicit_try
    try do
      to_string(first)
    rescue
      _ -> :rescued
    end
  end
end

defmodule ModuleWithExplicitTryX do
  @moduledoc ""
  defmacro failing_function(first) do
##Info: readability_prefer_implicit_try
    try do
      to_string(unquote(first))
    rescue
      _ -> :rescued
    end
  end
end
