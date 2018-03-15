defmodule Codacy.Credo.Generator.PatternsTest do
  alias Codacy.Credo.Generator.Patterns
  use ExUnit.Case
  doctest Codacy.Credo.Generator.Patterns

  describe "check_to_pattern/1" do
    test "when just check passed" do
      assert %{
               level: "Warning",
               patternId: "refactor_long_quote_blocks",
               category: "CodeStyle"
             } = Patterns.check_to_pattern({Credo.Check.Refactor.LongQuoteBlocks})
    end

    test "when priority specified in params" do
      assert %{
               level: "Info",
               patternId: "refactor_long_quote_blocks"
             } =
               Patterns.check_to_pattern({Credo.Check.Refactor.LongQuoteBlocks, [priority: :low]})
    end

    test "warning category" do
      assert %{category: "ErrorProne"} =
               Patterns.check_to_pattern({Credo.Check.Warning.LazyLogging})
    end

    test "when check is disables on .credo.exs" do
      expected = %{
        category: "CodeStyle",
        level: "Info",
        parameters: [%{default: 30, name: "max_size"}],
        patternId: "refactor_abc_size"
      }

      assert expected == Patterns.check_to_pattern({Credo.Check.Refactor.ABCSize, false})
    end
  end

  describe "check_to_parameters/1" do
    test "transforms parameters correctly" do
      check = Credo.Check.Refactor.PipeChainStart

      assert [
               %{
                 name: "excluded_functions",
                 default: []
               }
             ] == Patterns.check_to_parameters({check})
    end

    test "uses default params from .credo.exs" do
      check = Credo.Check.Readability.MaxLineLength

      assert [
               %{name: "max_length", default: 90},
               %{name: "ignore_definitions", default: true},
               %{name: "ignore_specs", default: false},
               %{name: "ignore_strings", default: true}
             ] == Patterns.check_to_parameters({check, max_length: 90})
    end

    test "When default param is regex" do
      check = Credo.Check.Readability.ModuleDoc

      assert [
               %{
                 default: [
                   ~S/(\.\w+Controller|\.Endpoint|\.Repo|\.Router|\.\w+Socket|\.\w+View)$/
                 ],
                 name: "ignore_names"
               }
             ] ==
               Patterns.check_to_parameters(
                 {check,
                  ignore_names: [
                    ~r/(\.\w+Controller|\.Endpoint|\.Repo|\.Router|\.\w+Socket|\.\w+View)$/
                  ]}
               )
    end
  end

  describe "load_checks" do
    test "loads generic .credo.exs from credo lib" do
      checks = Patterns.load_checks(File.cwd!())
      refute [] == checks
    end
  end

  describe "generate/1" do
    test "generates without error" do
      assert :ok = Codacy.Credo.Generator.Patterns.generate()
    end
  end
end
