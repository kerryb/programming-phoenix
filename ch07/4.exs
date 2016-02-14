defmodule MyList do
  def span(from, to), do: _span(from, [to])

  defp _span(from, list = [from|_]), do: list
  defp _span(from, [head|tail]), do: _span(from, [head-1, head | tail])
end
