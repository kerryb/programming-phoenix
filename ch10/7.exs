defmodule MyList do
  def span(from, to), do: _span(from, [to])

  defp _span(from, list = [from|_]), do: list
  defp _span(from, [head|tail]), do: _span(from, [head-1, head | tail])
end

defmodule Primes do
  def up_to(n) do
    for x <- MyList.span(2, n), is_prime(x), do: x
  end

  defp is_prime(x), do: _is_prime(x, div(x, 2))
  defp _is_prime(_, 1), do: true
  defp _is_prime(x, divisor) when rem(x, divisor) == 0, do: false
  defp _is_prime(x, divisor), do: _is_prime(x, divisor - 1)
end

for p <- Primes.up_to(100), do: IO.puts p
