defmodule FizzBuzz do
  def upto(n) when n > 0 do
    1..n |> Enum.map(&fizzbuzz/1)
  end

  defp fizzbuzz(n) do
    case n do
      a when rem(a, 3) == 0 and rem(a, 5) == 0 -> "FizzBuzz"
      a when rem(a, 3) == 0 -> "Fizz"
      a when rem(a, 5) == 0 -> "Buzz"
      a -> a
    end
  end
end
