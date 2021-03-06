defmodule Stack.Server do
  use GenServer

  def start_link stack do
    GenServer.start_link __MODULE__, stack, name: __MODULE__
  end

  def pop do
    GenServer.call __MODULE__, :pop
  end

  def push value do
    GenServer.cast __MODULE__, {:push, value}
  end

  def handle_call :pop, _from, stack do
    [head|tail] = stack
    {:reply, head, tail}
  end

  def handle_cast {:push, value}, stack do
    {:noreply, [value|stack]}
  end

  def terminate reason, state do
    IO.puts "Reason: #{inspect reason}"
    IO.puts "State: #{inspect state}"
  end
end
