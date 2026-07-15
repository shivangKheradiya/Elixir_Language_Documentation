defmodule ProcessDemo do

  def hello_process do
    IO.puts("\n=== HELLO PROCESS ===")

    pid =
      spawn(fn ->
        IO.puts("Hello from a child process")
      end)

    IO.puts("PID: #{inspect(pid)}")
  end

  def message_process do
    IO.puts("\n=== MESSAGE PASSING ===")

    pid =
      spawn(fn ->
        receive do
          message ->
            IO.puts("Received: #{message}")
        end
      end)

    send(pid, "Hello Process")
  end

  def tuple_message_process do
    IO.puts("\n=== PATTERN MATCHING ===")

    pid =
      spawn(fn ->
        receive do

          {:user, name} ->
            IO.puts("User: #{name}")

          {:error, reason} ->
            IO.puts("Error: #{reason}")

        end
      end)

    send(pid, {:user, "Shivang"})
  end

  def timeout_process do
    IO.puts("\n=== TIMEOUT ===")

    spawn(fn ->

      receive do
        message ->
          IO.puts(message)

      after
        2000 ->
          IO.puts("Timeout reached")
      end

    end)
  end

  def counter_process do
    IO.puts("\n=== COUNTER PROCESS ===")

    pid =
      spawn(fn ->
        counter_loop(0)
      end)

    send(pid, :increment)
    send(pid, :increment)
    send(pid, :increment)
    send(pid, :print)
  end

  defp counter_loop(count) do

    receive do

      :increment ->
        counter_loop(count + 1)

      :print ->
        IO.puts("Counter = #{count}")
        counter_loop(count)

    end
  end
end

IO.puts("Main PID: #{inspect(self())}")

ProcessDemo.hello_process()

ProcessDemo.message_process()

ProcessDemo.tuple_message_process()

ProcessDemo.timeout_process()

ProcessDemo.counter_process()

Process.sleep(3000)
