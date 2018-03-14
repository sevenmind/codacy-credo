defmodule Mix.Tasks.Codacy.Credo.Generate do
  alias Codacy.Credo.Patterns
  use Mix.Task

  @shortdoc "Generate patterns.json"
  @moduledoc @shortdoc

  def run(argv) do
    # TODO: Accept Version rgument
    #             Will have to download specified version & build from that

    Patterns.generate()
  end
end

# {
#   "name":"jshint",
#    "version": "",
#   "patterns":[
#     {
#       "patternId":"latedef",
#       "level": "Error",
#       "category": "UnusedCode",
#       "parameters":[
#         {
#           "name":"latedef",
#           "default":"vars"
#         }
#       ]
#     }
#   ]
# }

# levels
# Error, Warning, Info
# +20    , +10         , +1 -

# Catagories
#   ErrorProne, CodeStyle, UnusedCode, Security, Compatibility, Performance, Documentation
#
# documentation ->
#  consistency -> CodeStyle
#  design ->  CodeStyle
#  readability -> CodeStyle
#  refactor -> CodeStyle
#  warning -> ErrorProne
