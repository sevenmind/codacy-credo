##Patterns: consistency_tabs_or_spaces 
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
 ##Warning: consistency_tabs_or_spaces
	@test_attribute :foo
 ##Warning: consistency_tabs_or_spaces
	def foobar(parameter1, parameter2) do
 ##Warning: consistency_tabs_or_spaces
		String.split(parameter1) + parameter2
 ##Warning: consistency_tabs_or_spaces
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
