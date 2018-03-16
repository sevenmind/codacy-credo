##Patterns: readability_large_numbers
defmodule CredoLargeNumbers do
  @bignumber 90898980889888
  @moduledoc """
  """
  def numbers do
##Warning: readability_large_numbers
    x = 1024 + 1_000_000 + 43534

##Warning: readability_large_numbers
    + 1024 + 10_00_00_0 + 43534983489534298543895

##Warning: readability_large_numbers
     + 1022343242344 + 1_000_000 + 43534
    + 1024 + 1000000 + 43534

  end
end

##Warning: readability_large_numbers
00000000000000000000000000000000
