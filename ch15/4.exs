defmodule TickerRing do
  @interval 2000
  @name :ticker

  def start do
    spawn __MODULE__, :listen, []
  end

  def listen next_in_ring \\ self do
    receive do
      { :tick } ->
        IO.puts "tock"
        listen next_in_ring
    after
      @interval ->
        IO.puts "tick"
        send next_in_ring, { :tick }
        listen next_in_ring
    end
  end
end
