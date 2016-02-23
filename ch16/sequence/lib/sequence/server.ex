defmodule Sequence.Server do
  use GenServer

  def handle_call :next, _from, current do
    {:reply, current, current + 1}
  end
end
