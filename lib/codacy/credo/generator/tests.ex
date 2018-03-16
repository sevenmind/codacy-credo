defmodule Codacy.Credo.Generator.Tests do
  @moduledoc """
  Converst Credos Tests into Codacy test.ex files

  Assumes a local copy of credo at $HOME/tmp/credo
  This does a lot of AST traversal, and will break if testing converions in Credo change
  """

  alias Codacy.Credo.Generator.Patterns
  alias Credo.Execution
  alias Credo.SourceFile

  def generate() do
    Credo.start(nil, nil)

   File.cwd!()
    |> Patterns.load_checks()
    |> Enum.map(&find_tests/1)
    |> start_servers()
    |> Enum.map(&find_sources/1)
    |> Enum.map(&extract_tests_from_ast/1)
    |> Enum.map(&write_test/1)
    |> Enum.filter(& &1)
    |> IO.puts
  end

  def write_test(%{check: check, test_text: text, source_file: file}) do
    %{
      patternId: pattern_id,
      level: level
    } = Patterns.check_to_pattern({check})

    pattern_lines = "##Patterns: #{pattern_id} \n ###{level}: #{pattern_id}\n"
    test_text = format_test_text(text, file)

    content =  pattern_lines <> (List.flatten(test_text) |> Enum.join("\n"))
    File.write!("./docs/tests/#{pattern_id}.ex", content)

    if Enum.empty?(test_text) do
      pattern_id
    else
      nil
    end
  end

  defp format_test_text(text, _) when is_binary(text), do: text
  defp format_test_text(text, file) when is_list(text)  do
    Enum.map(text, &format_test_text(&1, file)) |> Enum.filter(& &1)
  end
  defp format_test_text({:@,  _, [{var_name, _, _}]}, [file]) do
   {:defmodule, _, [_, mod_ast]} = Credo.SourceFile.ast(file)
    extract_mod_instance_var(mod_ast, var_name)
  end
  defp format_test_text(_, _), do: nil

  def find_tests({check, _}), do:  find_tests({check})
  def find_tests({check}) do
    path = check
    |> Atom.to_string
    |> string_concat("Test")
    |> String.replace_prefix("Elixir.", "")
    |> Macro.underscore
    |> string_concat(".exs")
    |> special_cases()
    |> Path.expand("~/tmp/credo/test")

    {check, path}
  end

  defp find_sources({check, path} = args) do
    source_file =   put_in_exec([args]) |> Credo.Sources.find()

      %{
        source_file: source_file,
        path: path,
        check: check
      }
  end

  defp extract_tests_from_ast(%{source_file: [source]} = check) do
    Map.put(check, :test_text, extract_tests_from_ast(source))
  end
  defp extract_tests_from_ast(%SourceFile{} = source_file) do
    {:defmodule, _, [_, [do: {:__block__, _, tests}]]} = Credo.SourceFile.ast(source_file)

    tests
    |> Enum.filter(&test_asserts_issues/1)
    |> Enum.map(&extract_text_blocks/1)
  end

  defp puts(thing) do
    IO.inspect(thing)

    thing
  end

  defp test_asserts_issues({:test, _, [_desc, [do: {:|>, _, ast}]]}), do: Enum.any?(ast, &has_assert_issue?/1)
  defp test_asserts_issues(_), do: false

  defp has_assert_issue?({:assert_issue, _, _}), do: true
  defp has_assert_issue?({:assert_issues, _, _}), do: true
  defp has_assert_issue?(_), do: false

  defp extract_text_blocks({:test, _, [_desc, [do: {:|>, _, ast}]]}), do: Enum.map(ast, &extract_text_block/1)

  defp extract_text_block({:|>, _, [text, {:to_source_file, _, _}]}) when is_binary(text) , do: text
  defp extract_text_block({:|>, _, [text, {:to_source_files, _, _}]}) when is_list(text), do: text
  defp extract_text_block(_), do: nil

  defp start_servers(check) do
    check
    |> put_in_exec()
    |> Credo.Execution.SourceFiles.start_server
    |> Credo.Execution.Issues.start_server

    check
  end

  defp put_in_exec(files) do
    %Execution{
      files: %{
        included: Enum.map(files, &elem(&1, 1)),
        excluded: []
      }
    }
  end

  defp string_concat(str, concat), do: str <> concat

  defp special_cases(str_path) do
    cond do
      String.match?(str_path, ~r/i_ex/) -> String.replace(str_path, "i_ex", "iex")
      true -> str_path
    end
  end

  defp extract_mod_instance_var({:defmodule, _, mod}, var_name), do: extract_mod_instance_var(mod, var_name)
  defp extract_mod_instance_var([do: {_, _, definitions}], var_name) do
    {:@, _ ,[{_, _, [text] }]} =
    definitions
    |> Enum.filter(fn {type, _, _}-> type == :@ end)
    |> Enum.find(fn {:@, _, [{attr_name, _, _}]} -> attr_name == var_name end)

    text
  end
end
