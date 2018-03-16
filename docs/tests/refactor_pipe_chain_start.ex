##Patterns: refactor_pipe_chain_start
 ##Info: refactor_pipe_chain_start
String.trim("nope") |> String.upcase
 ##Info: refactor_pipe_chain_start
String.trim("nope")
|> String.downcase
|> String.trim

 ##Info: refactor_pipe_chain_start
fun([a, b, c])
|> something1
|> something2
|> something3
|> IO.inspect

 ##Info: refactor_pipe_chain_start
fun.([a, b, c]) |> IO.inspect
 ##Info: refactor_pipe_chain_start
fun.([a, b, c]) |> Enum.join |> IO.inspect
 ##Info: refactor_pipe_chain_start
fun.([a, b, c])
|> Enum.join
|> IO.inspect
