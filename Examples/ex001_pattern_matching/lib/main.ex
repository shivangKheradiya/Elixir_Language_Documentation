defmodule PatternMatchingDemo do

  def tuple_example do
    {:ok, name} = {:ok, "Shivang"}

    IO.puts("Tuple Match:")
    IO.puts(name)
  end

  def list_example do
    [head | tail] = [1, 2, 3, 4]

    IO.puts("\nList Match:")
    IO.puts("Head: #{head}")
    IO.inspect(tail)
  end

  def map_example do
    %{name: name} = %{
      name: "Shivang",
      city: "Madrid"
    }

    IO.puts("\nMap Match:")
    IO.puts(name)
  end

  def nested_example do
    {:ok, %{name: name}} =
      {:ok, %{name: "Shivang"}}

    IO.puts("\nNested Match:")
    IO.puts(name)
  end
end

PatternMatchingDemo.tuple_example()
PatternMatchingDemo.list_example()
PatternMatchingDemo.map_example()
PatternMatchingDemo.nested_example()