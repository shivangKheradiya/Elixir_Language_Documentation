# 05 - Recursion

## Overview

Recursion is one of the most important concepts in Elixir.

In many programming languages, iteration is typically performed using:

- for loops
- while loops
- foreach loops

In Elixir, recursion is the primary mechanism for processing collections and repeating operations.

Understanding recursion is essential before learning:

- Enum
- Stream
- Processes
- OTP
- GenServer

Many internal Elixir and Erlang libraries rely heavily on recursion.

---

# Learning Objectives

After completing this chapter, you will be able to:

✅ Understand recursion

✅ Write recursive functions

✅ Understand base cases

✅ Process lists recursively

✅ Understand stack growth

✅ Write tail-recursive functions

✅ Use accumulators

✅ Read production-grade Elixir code

---

# What is Recursion?

Recursion is a technique where a function calls itself.

General structure:

```text
Function
    ↓
Calls Itself
    ↓
Eventually Stops
```

Every recursive function requires:

1. Base Case
2. Recursive Case

---

# Simple Example

Count down from 5.

```elixir
defmodule Counter do

  def countdown(0) do
    IO.puts("Done")
  end

  def countdown(number) do
    IO.puts(number)

    countdown(number - 1)
  end

end
```

Run:

```elixir
Counter.countdown(5)
```

Output:

```text
5
4
3
2
1
Done
```

---

# Base Case

The base case stops recursion.

Example:

```elixir
def countdown(0) do
  IO.puts("Done")
end
```

Without a base case:

```text
Infinite Recursion
```

which eventually crashes.

---

# Recursive Case

The recursive case continues processing.

Example:

```elixir
def countdown(number) do
  countdown(number - 1)
end
```

---

# Factorial Example

Mathematical definition:

```text
5! = 5 × 4 × 3 × 2 × 1
```

Recursive implementation:

```elixir
defmodule Math do

  def factorial(0), do: 1

  def factorial(n) do
    n * factorial(n - 1)
  end

end
```

Usage:

```elixir
Math.factorial(5)
```

Output:

```text
120
```

---

# Understanding Recursive Execution

Example:

```elixir
factorial(3)
```

Execution:

```text
3 * factorial(2)

3 * (2 * factorial(1))

3 * (2 * (1 * factorial(0)))

3 * (2 * (1 * 1))

6
```

---

# Recursion and Lists

Lists are commonly processed recursively.

Example:

```elixir
[1,2,3,4]
```

Can be split into:

```elixir
[head | tail]
```

Result:

```text
head = 1
tail = [2,3,4]
```

This pattern is the foundation of recursive list processing.

---

# Sum a List

Example:

```elixir
defmodule ListMath do

  def sum([]) do
    0
  end

  def sum([head | tail]) do
    head + sum(tail)
  end

end
```

Usage:

```elixir
ListMath.sum([1,2,3,4])
```

Output:

```text
10
```

---

# Recursive Flow

Example:

```elixir
sum([1,2,3])
```

Processing:

```text
1 + sum([2,3])

1 + (2 + sum([3]))

1 + (2 + (3 + sum([])))

1 + (2 + (3 + 0))

6
```

---

# Length of a List

Example:

```elixir
defmodule ListHelper do

  def length([]), do: 0

  def length([_head | tail]) do
    1 + length(tail)
  end

end
```

Usage:

```elixir
ListHelper.length([1,2,3,4])
```

Output:

```text
4
```

---

# Tail Recursion

Basic recursion can consume stack memory.

Example:

```elixir
def sum([head | tail]) do
  head + sum(tail)
end
```

The runtime must remember unfinished work.

---

# Tail-Recursive Approach

A tail-recursive function performs the recursive call as the final operation.

Example:

```elixir
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
```

Usage:

```elixir
ListMath.sum([1,2,3,4])
```

Output:

```text
10
```

---

# Accumulator

An accumulator keeps intermediate results.

Example:

```elixir
acc
```

Common pattern:

```elixir
process(list, acc)
```

Advantages:

- Better performance
- Lower memory usage
- Preferred in large recursive operations

---

# Reverse a List

Example:

```elixir
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
```

Usage:

```elixir
ListHelper.reverse([1,2,3])
```

Output:

```text
[3,2,1]
```

---

# Pattern Matching + Recursion

Recursion and pattern matching are usually combined.

Example:

```elixir
def print([]), do: :ok

def print([head | tail]) do
  IO.puts(head)
  print(tail)
end
```

This is a very common Elixir pattern.

---

# Recursion vs Loops

C#

```csharp
foreach(var item in items)
{
    Console.WriteLine(item);
}
```

Elixir

```elixir
def print([]), do: :ok

def print([head | tail]) do
  IO.puts(head)
  print(tail)
end
```

---

# Recursion vs Enum

Recursion:

```elixir
sum([1,2,3])
```

Practical Elixir:

```elixir
Enum.sum([1,2,3])
```

Although Enum is used most of the time, recursion is still critical because:

- OTP uses recursion
- GenServers use recursion internally
- Understanding recursion helps understand the BEAM model

---

# Best Practices

### Always Define a Base Case

Without a base case recursion never stops.

---

### Prefer Tail Recursion

For large collections use accumulators.

---

### Use Pattern Matching

Pattern matching makes recursive code cleaner and easier to read.

---

### Keep Recursive Functions Focused

Avoid complex business logic inside recursive loops.

---

# Common Mistakes

### Missing Base Case

```elixir
def count(n) do
  count(n - 1)
end
```

Never terminates.

---

### Forgetting Empty Lists

```elixir
sum([head | tail])
```

Must also handle:

```elixir
sum([])
```

---

### Overusing Recursion

In production code:

```elixir
Enum
Stream
```

are often preferred for readability.

---

# Comparison with C#

C#

```csharp
numbers.Sum();
```

Elixir

```elixir
Enum.sum(numbers)
```

---

C#

```csharp
foreach(var item in numbers)
{
}
```

Elixir

```elixir
process([head | tail])
```

---

# Summary

In this chapter you learned:

- Recursion
- Base Cases
- Recursive Cases
- List Processing
- Tail Recursion
- Accumulators
- Recursive Algorithms
- Pattern Matching with Recursion

Recursion is a foundational concept in Elixir and prepares you for:

- Enum
- Stream
- Processes
- OTP
- GenServer

The next chapter is:

**06 - Enum & Collections**

where we learn the practical tools used daily to transform and process data without writing recursive code manually.
`