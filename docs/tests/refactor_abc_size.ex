##Patterns: refactor_abc_size

defmodule CheckModule do
##Info: refactor_abc_size
  def run_thing(opts) do
    source_file = IssueMeta.source_file(issue_meta)
    params = IssueMeta.params(issue_meta)

    priority =
      if params[:priority] do
        params[:priority] |> Check.to_priority()
      else
        base_priority
      end

    line_no = opts[:line_no]
    trigger = opts[:trigger]
    column = opts[:column]
    severity = opts[:severity] || Severity.default_value()

    issue = %Issue{
      priority: priority,
      filename: source_file.filename,
      message: opts[:message],
      trigger: trigger,
      line_no: line_no,
      column: column,
      severity: severity
    }

    if line_no do
      {_def, scope} = CodeHelper.scope_for(source_file.ast, line: line_no)

      issue = %Issue{
        issue
        | priority: issue.priority + priority_for(source_file, scope),
          scope: scope
      }
    end

    if trigger && line_no && !column do
      issue = %Issue{
        issue
        | column: SourceFile.column(source_file, line_no, trigger)
      }
    end

    format_issue(issue)

    %Issue{
      issue
      | check: __MODULE__,
        category: category
    }

    scope_prio_map = Priority.scope_priorities(source_file)
    scope_prio_map[scope] || 0

    if true == true or false == 2 do
      my_options = MyHash.create()
    end

    my_options
    |> Enum.each(fn key, value ->
      IO.puts(key)
      IO.puts(value)
    end)

    if true == true or false == 2 do
      my_options = MyHash.create()
    end

    my_options
    |> Enum.each(fn key, value ->
      IO.puts(key)
      IO.puts(value)
    end)

    if true == true or false == 2 do
      my_options = MyHash.create()
    end

    my_options
    |> Enum.each(fn key, value ->
      IO.puts(key)
      IO.puts(value)
    end)

    if true == true or false == 2 do
      my_options = MyHash.create()
    end

    my_options
    |> Enum.each(fn key, value ->
      IO.puts(key)
      IO.puts(value)
    end)
  end
end
