##Patterns: consistency_exception_names
defmodule Credo.Sample do
 ##Warning: consistency_exception_names
  defmodule SomeError do
    defexception [:message]
  end
end

defmodule UndefinedResponse do
  defexception [:message]
end

defmodule Credo.Sample do
 ##Warning: consistency_exception_names
  defmodule SomeException do
    defexception [:message]
  end

  defmodule UndefinedResponse do    # <--- does not have the suffix "Exception"
    defexception [:message]
  end
end

 ##Warning: consistency_exception_names
defmodule InputValidationException do
  defexception [:message]
end

defmodule Credo.Sample do
 ##Warning: consistency_exception_names
  defmodule InvalidDataRequest do
    defexception [:message]
  end
end

 ##Warning: consistency_exception_names
defmodule InvalidReponseFromServer do
  defexception [:message]
end

defmodule UndefinedDataFormat do    # <--- does not have the prefix "Invalid"
  defexception [:message]
end
