defmodule Stack.Server do
  use GenServer

  def start_link stash_pid do
    GenServer.start_link __MODULE__, stash_pid, name: __MODULE__
  end

  def pop do
    GenServer.call __MODULE__, :pop
  end

  def push value do
    GenServer.cast __MODULE__, {:push, value}
  end

  def init stash_pid do
    contents = Stack.Stash.value stash_pid
    {:ok, {contents, stash_pid}}
  end

  def handle_call :pop, _from, {contents, stash_pid} do
    [head|tail] = contents
    :ok = Stack.Stash.save stash_pid, tail
    {:reply, head, {tail, stash_pid}}
  end

  def handle_cast {:push, value}, {contents, stash_pid} do
    new_contents = [value|contents]
    :ok = Stack.Stash.save stash_pid, new_contents
    {:noreply, {new_contents, stash_pid}}
  end
end
