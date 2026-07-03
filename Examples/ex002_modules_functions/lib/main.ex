defmodule Calculator do
  def add(a, b), do: a + b

  def subtract(a, b), do: a - b

  def multiply(a, b), do: a * b
end

defmodule UserService do
  @company "OPECore"

  def welcome(name \\ "Guest") do
    format_message(name)
  end

  def company do
    @company
  end

  defp format_message(name) do
    "Welcome #{name}"
  end
end

defmodule NumberValidator do
  def positive?(number)
      when number > 0 do
    true
  end

  def positive?(_), do: false
end

IO.puts("Calculator")

IO.puts(Calculator.add(10, 20))
IO.puts(Calculator.subtract(30, 10))
IO.puts(Calculator.multiply(5, 6))

IO.puts("\nUser Service")

IO.puts(UserService.welcome())
IO.puts(UserService.welcome("Shivang"))
IO.puts(UserService.company())

IO.puts("\nValidator")

IO.inspect(NumberValidator.positive?(10))
IO.inspect(NumberValidator.positive?(-5))