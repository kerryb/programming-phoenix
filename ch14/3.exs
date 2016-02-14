import :timer, only: [ sleep: 1 ]

defmodule MessageBeforeReceive do
  def reply_and_die(sender) do
    send sender, :aargh
    exit :plop
  end

  def run do
    spawn_link MessageBeforeReceive, :reply_and_die, [self]
    sleep 500
    receive_all_messages
  end

  defp receive_all_messages do
    receive do
      message ->
        IO.inspect message
        receive_all_messages
    after 1000 -> IO.puts "No more messages"
    end
  end
end

MessageBeforeReceive.run
