defmodule IntegrationSpec do
  use ESpec

  subject(Stack.Server)

  defp wait_for_death pid do
    new_pid = GenServer.whereis subject
    if is_nil(new_pid) || new_pid == pid do
      :timer.sleep 1
      wait_for_death pid
    end
  end

  it "pops values in reverse push order" do
    subject.push 42
    subject.push "Hello"
    expect([subject.pop, subject.pop]).to eq ["Hello", 42]
  end

  it "survives the death of its server" do
    subject.push 42
    pid = GenServer.whereis subject
    Agent.stop pid
    wait_for_death pid
    expect(subject.pop).to eq 42
  end
end
