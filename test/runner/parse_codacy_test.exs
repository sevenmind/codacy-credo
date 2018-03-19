defmodule Codacy.Credo.ConfigTest do
  alias Codacy.Credo.Config
  use ExUnit.Case

  describe "parse codacy.json" do
    test "Builds included file list from config" do
      example_json = %{
        files: ["lib/app.ex"],
        tools: [
          %{
            name: "credo",
            patterns: [
              %{
                # Simple case
                patternId: "consistency_exception_names",
                parameters: []
              }
            ]
          }
        ]
      }

      expected_files = %{
        included: ["lib/app.ex"],
        excluded: [~r/\/_build\//, ~r/\/deps\//]
      }

      assert expected_files ==
               Config.extract_credo_config(%Config{codacy_config: example_json}).credo_config[
                 :files
               ]
    end

    test "ignores non credo tools" do
      example_json = %{
        files: ["lib/app.ex"],
        tools: [
          %{
            # Should ignore tools that aren't Credo
            name: "rubocop",
            patterns: []
          },
          %{
            name: "credo",
            patterns: [
              %{
                # Simple case
                patternId: "consistency_exception_names",
                parameters: []
              }
            ]
          }
        ]
      }

      expected_checks = [{Credo.Check.Consistency.ExceptionNames}]

      assert expected_checks ==
               Config.extract_credo_config(%Config{codacy_config: example_json}).credo_config[
                 :checks
               ]
    end

    test "when check module with odd name" do
      example_json = %{
        files: ["lib/app.ex"],
        tools: [
          %{
            name: "credo",
            patterns: [
              %{
                # Odd module name
                patternId: "design_tag_fixme"
              }
            ]
          }
        ]
      }

      expected_checks = [{Credo.Check.Design.TagFIXME}]

      assert expected_checks ==
               Config.extract_credo_config(%Config{codacy_config: example_json}).credo_config[
                 :checks
               ]
    end

    test "when params provided" do
      example_json = %{
        files: ["lib/app.ex"],
        tools: [
          %{
            name: "credo",
            patterns: [
              %{
                # Override default param
                patternId: "readability_max_line_length",
                parameters: [
                  %{
                    name: "max_length",
                    value: 120
                  }
                ],
                level: "Info",
                category: "CodeStyle"
              }
            ]
          }
        ]
      }

      expected_config = %{
        checks: [
          {Credo.Check.Readability.MaxLineLength, max_length: 120}
        ]
      }

      assert expected_config[:checks] ==
               Config.extract_credo_config(%Config{codacy_config: example_json}).credo_config[
                 :checks
               ]
    end
  end
end
