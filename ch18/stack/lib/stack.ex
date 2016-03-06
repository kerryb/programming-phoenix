defmodule Stack do
  use Application

  def start _type, contents do
    {:ok, _pid} = Stack.Supervisor.start_link contents
  end
end
