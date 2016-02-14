defmodule MyEnum do
  def all?(list, fun), do: _all?(list, fun, true)
  def _all?(_, _, false), do: false
  def _all?([], _, _), do: true
  def _all?([head|tail], fun, _), do: _all?(tail, fun, fun.(head))

  def each([], _), do: :ok
  def each([head|tail], fun) do
    fun.(head)
    each tail, fun
  end

  def filter(list, fun), do: _filter(list, fun, []) |> Enum.reverse
  defp _filter([], _, result), do: result
  defp _filter([head|tail], fun, result) do
    if fun.(head) do
      _filter(tail, fun, [head|result])
    else
      _filter(tail, fun, result)
    end
  end
  

  def split(list, n), do: _split(list, n, [])
  defp _split(list, 0, extracted), do: [Enum.reverse(extracted), list]
  defp _split([head|tail], n, extracted), do: _split(tail, n - 1, [head|extracted])

  def take(list, n), do: _take(list, n, []) |> Enum.reverse
  defp _take(_, 0, taken), do: taken
  defp _take([head|tail], n, taken), do: _take(tail, n - 1, [head|taken])
end
