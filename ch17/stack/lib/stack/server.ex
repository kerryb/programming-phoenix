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
    {:reply, head, {tail, stash_pid}}
  end

  def handle_cast {:push, value}, {contents, stash_pid} do
    {:noreply, {[value|contents], stash_pid}}
  end

  def terminate _reason, {contents, stash_pid} do
    Stack.Stash.save stash_pid, contents
  end
end
