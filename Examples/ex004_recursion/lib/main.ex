defmodule Counter do
  def countdown(0) do
    IO.puts("Done")
  end

  def countdown(number) do
    IO.puts(number)
    countdown(number - 1)
  end
end

defmodule Math do
  def factorial(0), do: 1

  def factorial(n) do
    n * factorial(n - 1)
  end
end

defmodule ListMath do
  def sum(list) do
    do_sum(list, 0)
  end

  defp do_sum([], acc) do
    acc
  end

  defp do_sum([head | tail], acc) do
    do_sum(tail, acc + head)
  end
end

defmodule ListHelper do
  def reverse(list) do
    do_reverse(list, [])
  end

  defp do_reverse([], acc) do
    acc
  end

  defp do_reverse([head | tail], acc) do
    do_reverse(tail, [head | acc])
  end
end

IO.puts("=== Countdown ===")
Counter.countdown(5)

IO.puts("\n=== Factorial ===")
IO.puts(Math.factorial(5))

IO.puts("\n=== Tail Recursive Sum ===")
IO.puts(ListMath.sum([1, 2, 3, 4, 5]))

IO.puts("\n=== Reverse List ===")
IO.inspect(ListHelper.reverse([1, 2, 3, 4, 5]))
