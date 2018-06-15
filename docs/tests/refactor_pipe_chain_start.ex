##Patterns: refactor_pipe_chain_start
 ##Info: refactor_pipe_chain_start
String.trim("nope") |> String.upcase

String.trim("nope")
##Info: refactor_pipe_chain_start
|> String.downcase
|> String.trim

fun([a, b, c])
 ##Info: refactor_pipe_chain_start
|> something1
|> something2
|> something3
|> IO.inspect

 ##Info: refactor_pipe_chain_start
fun.([a, b, c]) |> IO.inspect

##Info: refactor_pipe_chain_start
fun.([a, b, c]) |> Enum.join |> IO.inspect

fun.([a, b, c])
 ##Info: refactor_pipe_chain_start
|> Enum.join
|> IO.inspect
