defmodule Echo do
  def listen do
    receive do
      {sender, message} -> send sender, {:ok, message}
      listen
    after 500 -> IO.puts "listen timed out"
    end
  end

  def run word do
    echo = spawn Echo, :listen, []
    send echo, {self, word}
    receive do
      {:ok, message} -> IO.puts message
    after 500 -> IO.puts "run receiver timed out"
    end
  end
end

Echo.run "foo"
Echo.run "bar"
