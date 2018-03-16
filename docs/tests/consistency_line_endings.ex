##Patterns: consistency_line_endings 
 ##Warning: consistency_line_endings
defmodule Credo.Sample do
  defmodule InlineModule do
    def foobar do
      {:ok} = File.read
    end
  end
end

defmodule Credo.Sample do
@test_attribute :foo
end

