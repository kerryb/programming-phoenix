defmodule Stack do
  use Application

  def start _type, _args do
    {:ok, _pid} = Stack.Supervisor.start_link [42, "foo", :bar]
  end
end
