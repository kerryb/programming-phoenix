defmodule Sequence.Server do
  use GenServer

  def handle_call :next, _from, current do
    {:reply, current, current + 1}
  end

  def handle_cast {:increment_by, delta}, current do
    {:noreply, current + delta}
  end
end
