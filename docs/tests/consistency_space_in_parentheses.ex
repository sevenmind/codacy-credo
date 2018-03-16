##Patterns: consistency_space_in_parentheses
 ##Warning: consistency_space_in_parentheses
defmodule Credo.Sample1 do
  @default_sources_glob ~w(** *.{ex,exs})
  @username_regex ~r/^[A-z0-9 ]+$/
  @options [foo: 1, bar: 2, ]

  defmodule InlineModule do
    def foobar do
      {:ok} = File.read(filename)

      parse_code(t, {:some_tuple, 1})
      parse_code(t, acc <> ~s("""))
    end
    defp count([], acc), do: acc
    defp count([?( | t], acc), do: count(t, acc + 1)
    defp count([?) | t], acc), do: count(t, acc - 1)
  end

  def credo_test do
    sh_snip = 'if [ ! -d /somedir ] ...'
    foo = 'and here are some ( parenthesis )'
  end
end

defmodule Credo.Sample2 do
  defmodule InlineModule do
    def foobar do
 ##Warning: consistency_space_in_parentheses
      { :ok } = File.read( filename )
    end
  end
end

defmodule OtherModule3 do
  defmacro foo do
 ##Warning: consistency_space_in_parentheses
      { :ok } = File.read( filename )
  end

  defp bar do
    :ok
  end
end

defmodule OtherModule3 do
  defmacro foo do
 ##Warning: consistency_space_in_parentheses
    { :ok } = File.read( filename )
  end

  defp bar do
    {:ok, :test}
  end
end
