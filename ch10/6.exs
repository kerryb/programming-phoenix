defmodule MyEnum do
  def flatten(list), do: Enum.reverse _flatten(list, [])
  defp _flatten([], flat_list), do: flat_list
  defp _flatten([head|tail], flat_list), do: _flatten(tail, _flatten(head, []) ++ flat_list)
  defp _flatten(element, flat_list), do: [element | flat_list]
end
