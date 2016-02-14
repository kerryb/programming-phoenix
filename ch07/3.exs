defmodule MyList do
  def caesar(list, n), do: Enum.map(list, &(rotate &1, n))

  defp rotate(char, n) when char + n <= ?z, do: char + n
  defp rotate(char, n) when char + n > ?z, do: char + n - 26
end
