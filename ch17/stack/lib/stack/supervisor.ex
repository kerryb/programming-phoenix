defmodule Stack.Supervisor do
  use Supervisor

  def start_link contents do
    result = {:ok, sup } = Supervisor.start_link __MODULE__, [contents], name: __MODULE__
    start_workers(sup, contents)
    result
  end

  def start_workers(sup, contents) do
    {:ok, stash} = Supervisor.start_child(sup, worker(Stack.Stash, [contents]))
    Supervisor.start_child(sup, supervisor(Stack.SubSupervisor, [stash]))
  end

  def init(_) do
    supervise [], strategy: :one_for_one
  end
end
