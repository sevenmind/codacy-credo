##Patterns: consistency_tabs_or_spaces 
 ##Warning: consistency_tabs_or_spaces
defmodule Credo.Sample do
  defmodule InlineModule do
    def foobar do
      {:ok} = File.read
    end
  end
end

defmodule OtherModule do
  defmacro foo do
    {:ok} = File.read
  end

  defp bar do
    :ok
  end
end

defmodule Credo.Sample do
	@test_attribute :foo

	def foobar(parameter1, parameter2) do
		String.split(parameter1) + parameter2
	end
end

defmodule Credo.Sample do
  defmodule InlineModule do
    def foobar do
      {:ok} = File.read
    end
  end
end

defmodule OtherModule do
  defmacro foo do
    {:ok} = File.read
  end

  defp bar do
    :ok
  end
end

defmodule Credo.Sample do
  defmodule InlineModule do
    def foobar do
      {:ok} = File.read
    end
  end
end

defmodule OtherModule do
  defmacro foo do
    {:ok} = File.read
  end

  defp bar do
    :ok
  end
end
