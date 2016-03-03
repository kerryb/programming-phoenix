defmodule Sequence.Server do
  use GenServer

  def start_link(current_number) do
    GenServer.start_link(__MODULE__, current_number, name: __MODULE__)
  end

  def next do
    GenServer.call __MODULE__, :next
  end

  def increment_by delta do
    GenServer.cast __MODULE__, {:increment, delta}
  end

  def handle_call :next, _from, current_number do
    { :reply, current_number, current_number+1 }
  end

  def handle_cast {:increment, delta}, current_number do
    { :noreply, current_number + delta}
  end

  def format_status _reason, [ _pdict, state ] do
    [data: [{'State', "My current state is '#{inspect state}', and I'm happy"}]] 
  end
end
