defmodule ThinkOfANumber do
  def guess(actual, range), do: guess(actual, range, mid(range))

  def guess(actual, _, current_guess) when actual == current_guess, do: IO.puts actual

  def guess(actual, (lower.._), current_guess) when actual < current_guess do
    IO.puts "Lower than #{current_guess}"
    guess actual, lower..(current_guess - 1)
  end

  def guess(actual, (_..upper), current_guess) when actual > current_guess do
    IO.puts "Higher than #{current_guess}"
    guess actual, (current_guess + 1)..upper
  end

  defp mid((a..b)), do: a + div(b - a, 2)
end
