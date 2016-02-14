defmodule Strings do
  def printable?(str), do: Enum.all?(str, &(&1 in ? ..?~))
end
