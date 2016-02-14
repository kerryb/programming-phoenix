defmodule MyList do
  def max([head|[]]), do: head
  def max([head|[next|tail]]) when head >= next, do: max [head|tail]
  def max([head|[next|tail]]) when head < next, do: max [next|tail]
end
