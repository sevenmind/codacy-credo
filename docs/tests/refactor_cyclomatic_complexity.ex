## Patterns: refactor_cyclomatic_complexity
## Info: refactor_cyclomatic_complexity
def some_function do
  if x == 0, do: x = 1
end

def first_fun do
  if first_condition do
    call_something
  else
    if second_condition do
      call_something
    else
      if third_condition, do: call_something
    end

    if fourth_condition, do: call_something_else

    if first_condition do
      if second_condition && third_condition, do: call_something
      if fourth_condition || fifth_condition, do: call_something_else

      case param do
        1 ->
          if 1 == 1 or 2 == 2 do
            my_options = %{}
          end

        2 ->
          do_something_else

        _ ->
          do_something_even_more_else
      end
    end
  end
end
