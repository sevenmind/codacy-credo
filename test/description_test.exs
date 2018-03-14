defmodule Codacy.Credo.DescriptionTest do
  alias Codacy.Credo.Description
  use ExUnit.Case
  doctest Codacy.Credo.Description

  describe "build_check_description/1" do
    test "builds a description with patternId" do
      assert %{patternId: "refactor_long_quote_blocks"} =
               Description.build_check_description(Credo.Check.Refactor.LongQuoteBlocks)
    end

    test "builds a title from check module name" do
      assert %{
               title: "Refactor Long Quote Blocks"
             } = Description.build_check_description(Credo.Check.Refactor.LongQuoteBlocks)
    end

    test "uses the first line of the check explanation as description" do
      expected =
        "Long `quote` blocks are generally an indication that too much is done inside them."

      result =
        Description.build_check_description(Credo.Check.Refactor.LongQuoteBlocks)[:description]

      assert expected == result
    end

    test "with a complete description" do
      expected = %{
        description:
          "Long `quote` blocks are generally an indication that too much is done inside them.",
        parameters: [
          %{
            description: "The maximum number of lines a quote block should be allowed to have.",
            name: "max_line_count"
          }
        ],
        patternId: "refactor_long_quote_blocks",
        timeToFix: 5,
        title: "Refactor Long Quote Blocks"
      }

      result = Description.build_check_description(Credo.Check.Refactor.LongQuoteBlocks)

      assert expected == result
    end
  end

  describe "generate_json/1" do
    test "generates without error" do
      assert :ok = Description.generate_json()
    end
  end
end
