defmodule TickerList do
  @name :tickerlist

  def start do
    pid = spawn __MODULE__, :listen, [[]]
    :global.register_name @name, pid
  end

  def register client_pid do
    send :global.whereis_name(@name), {:register, client_pid}
  end

  def next_pid client_pid do
    send :global.whereis_name(@name), {:next_pid, self, client_pid}
    receive do
      {:ok, ^client_pid, next_pid} -> next_pid
    end
  end

  def listen clients do
    receive do
      {:register, pid} ->
        if Enum.empty? clients do
          send pid, {:tick}
        end
        listen clients ++ [pid]
      {:next_pid, pid, client_pid} ->
        send pid, {:ok, client_pid, hd clients}
        listen tl clients ++ [hd clients]
    end
  end
end

defmodule Ticker do
  @interval 2000

  def start do
    pid = spawn __MODULE__, :listen, []
    TickerList.register pid
  end

  def listen do
    receive do
      {:tick} ->
        pid = TickerList.next_pid self
        IO.puts "tick from #{inspect self} to #{inspect pid}"
        :timer.send_after @interval, pid, {:tick}
        listen
      message ->
        IO.puts "Unexpected message #{inspect message}"
        listen
    end
  end
end
