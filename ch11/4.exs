defmodule Calculator do
  def calculate(str), do: _calculate(str, 0)

  defp _calculate([head|tail], number1) when head in ?0..?9, do: _calculate(tail, _add_digit(number1, head))
  defp _calculate([head|tail], number1) when head in '+-*/', do: _calculate(tail, number1, head, 0)
  defp _calculate([_|tail], number1), do: _calculate(tail, number1)

  defp _calculate([head|tail], number1, operand, number2) when head in ?0..?9, do: _calculate(tail, number1, operand, _add_digit(number2, head))
  defp _calculate([_|tail], number1, operand, number2), do: _calculate(tail, number1, operand, number2)
  defp _calculate([], number1, ?+, number2), do: number1 + number2
  defp _calculate([], number1, ?-, number2), do: number1 - number2
  defp _calculate([], number1, ?*, number2), do: number1 * number2
  defp _calculate([], number1, ?/, number2), do: number1 / number2

  defp _add_digit(number, chr), do: number * 10 + chr - ?0
end
