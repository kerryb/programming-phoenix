defmodule Ok do
  def ok!({:ok, data}), do: data
  def ok!(error), do: raise inspect(error)
end

IO.puts "Opening file that exists..."
file = Ok.ok! File.open("#{__DIR__}/3.exs")
IO.puts "Opening file that doesn't exist..."
Ok.ok! File.open("wibble")
