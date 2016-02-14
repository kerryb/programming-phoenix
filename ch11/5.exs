defmodule Strings do
  def centre(strings) do
    width = Enum.max(Enum.map strings, &String.length/1)
    Enum.each strings, &(_print_centred &1, width)
  end

  defp _print_centred(str, width) do
    length = String.length(str)
    pad_to_width = length + div(width - length, 2)
    IO.puts String.rjust(str, pad_to_width)
  end
end
