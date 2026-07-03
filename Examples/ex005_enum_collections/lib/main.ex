defmodule EnumDemo do

  def map_example do
    IO.puts("\n=== MAP ===")

    result =
      [1, 2, 3, 4, 5]
      |> Enum.map(&(&1 * 2))

    IO.inspect(result)
  end

  def filter_example do
    IO.puts("\n=== FILTER ===")

    result =
      [1, 2, 3, 4, 5, 6]
      |> Enum.filter(&(rem(&1, 2) == 0))

    IO.inspect(result)
  end

  def reduce_example do
    IO.puts("\n=== REDUCE ===")

    result =
      Enum.reduce(
        [1, 2, 3, 4, 5],
        0,
        fn value, acc ->
          acc + value
        end
      )

    IO.puts(result)
  end

  def find_example do
    IO.puts("\n=== FIND ===")

    result =
      Enum.find(
        [10, 20, 30, 40, 50],
        fn value ->
          value > 25
        end
      )

    IO.puts(result)
  end

  def group_by_example do
    IO.puts("\n=== GROUP BY ===")

    users = [
      %{name: "John", country: "UK"},
      %{name: "Karen", country: "Spain"},
      %{name: "Mike", country: "UK"},
      %{name: "Shivang", country: "Spain"}
    ]

    result =
      Enum.group_by(
        users,
        & &1.country
      )

    IO.inspect(result)
  end

  def pipeline_example do
    IO.puts("\n=== PIPELINE ===")

    result =
      [1, 2, 3, 4, 5]
      |> Enum.filter(&(rem(&1, 2) == 1))
      |> Enum.map(&(&1 * 10))
      |> Enum.sum()

    IO.puts(result)
  end
end

EnumDemo.map_example()
EnumDemo.filter_example()
EnumDemo.reduce_example()
EnumDemo.find_example()
EnumDemo.group_by_example()
EnumDemo.pipeline_example()
