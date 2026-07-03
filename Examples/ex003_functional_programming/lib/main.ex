defmodule FunctionalDemo do

  def pure_function_example do
    IO.puts("\n=== Pure Function ===")

    add = fn a, b ->
      a + b
    end

    result = add.(10, 20)

    IO.puts("10 + 20 = #{result}")
  end

  def closure_example do
    IO.puts("\n=== Closure Example ===")

    factor = 5

    multiply = fn value ->
      value * factor
    end

    IO.puts("10 * 5 = #{multiply.(10)}")
  end

  def map_example do
    IO.puts("\n=== Enum.map ===")

    result =
      [1, 2, 3, 4, 5]
      |> Enum.map(fn x -> x * 2 end)

    IO.inspect(result)
  end

  def filter_example do
    IO.puts("\n=== Enum.filter ===")

    result =
      [1, 2, 3, 4, 5, 6]
      |> Enum.filter(fn x ->
        rem(x, 2) == 0
      end)

    IO.inspect(result)
  end

  def reduce_example do
    IO.puts("\n=== Enum.reduce ===")

    result =
      Enum.reduce(
        [1, 2, 3, 4, 5],
        0,
        fn value, acc ->
          acc + value
        end
      )

    IO.puts("Total: #{result}")
  end

  def pipeline_example do
    IO.puts("\n=== Functional Pipeline ===")

    result =
      [1, 2, 3, 4, 5]
      |> Enum.filter(fn x -> rem(x, 2) == 1 end)
      |> Enum.map(fn x -> x * 10 end)
      |> Enum.sum()

    IO.puts("Pipeline Result: #{result}")
  end
end

FunctionalDemo.pure_function_example()
FunctionalDemo.closure_example()
FunctionalDemo.map_example()
FunctionalDemo.filter_example()
FunctionalDemo.reduce_example()
FunctionalDemo.pipeline_example()