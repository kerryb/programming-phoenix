defmodule Stack.Stash do
  use GenServer

  def start_link contents do
    {:ok,_pid} = GenServer.start_link  __MODULE__, contents, name: __MODULE__
  end

  def save pid, contents do
    GenServer.cast pid, {:save, contents}
  end

  def value pid do
    GenServer.call pid, :value
  end

  def handle_call :value, _from, contents do 
    {:reply, contents, contents}
  end

  def handle_cast {:save, contents}, _contents do
    {:noreply, contents}
  end
end
