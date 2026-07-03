# 04 - Functional Programming

## Overview

Functional Programming is the foundation of Elixir.

Unlike object-oriented languages such as C#, Java, and C++, Elixir encourages developers to think in terms of:

- Data transformations
- Functions
- Immutability
- Composition
- Declarative programming

Instead of asking:

```text
How do I change this object?
```

Functional programming asks:

```text
How do I transform this data into new data?
```

Understanding this mindset is essential before learning:

- Enum
- Stream
- Recursion
- Processes
- OTP
- GenServer
- Phoenix

---

# Learning Objectives

After completing this chapter, you will be able to:

✅ Understand Functional Programming

✅ Understand Immutable Data

✅ Create Pure Functions

✅ Use First-Class Functions

✅ Use Higher-Order Functions

✅ Work with Closures

✅ Compose Functions

✅ Write More Idiomatic Elixir

---

# What is Functional Programming?

Functional Programming (FP) is a programming paradigm where functions are the primary building blocks of an application.

Applications are built by:

```text
Input
  ↓
Function
  ↓
New Data
```

instead of:

```text
Object
  ↓
Modify State
  ↓
Updated Object
```

---

# Imperative vs Functional

## Imperative Approach

C# Example

```csharp
int total = 0;

foreach(var number in numbers)
{
    total += number;
}
```

Focus:

```text
How to perform the operation
```

---

## Functional Approach

Elixir Example

```elixir
Enum.sum(numbers)
```

Focus:

```text
What result should be produced
```

---

# Immutability

One of the most important principles.

Values never change.

Example:

```elixir
name = "Shivang"

name = "John"
```

A new binding is created.

The original value remains unchanged.

---

# Mutable Mentality

Traditional approach:

```text
Create Object
Change Object
Save Object
```

---

# Functional Mentality

Functional approach:

```text
Input Data
Transform Data
Return New Data
```

---

# Pure Functions

A Pure Function:

- Always returns the same output for the same input
- Produces no side effects

Example:

```elixir
def add(a, b) do
  a + b
end
```

Input:

```elixir
add(10, 20)
```

Output:

```elixir
30
```

Always.

---

# Impure Function

Example:

```elixir
def current_time do
  DateTime.utc_now()
end
```

Same input:

```elixir
current_time()
```

Different outputs.

Not pure.

---

# Benefits of Pure Functions

Pure functions are:

- Easier to test
- Easier to debug
- Predictable
- Parallel-friendly
- Reusable

---

# First-Class Functions

Functions are values.

Store a function in a variable:

```elixir
add = fn a, b ->
  a + b
end
```

Call:

```elixir
add.(10, 20)
```

Output:

```elixir
30
```

---

# Passing Functions as Arguments

Functions can be passed to other functions.

Example:

```elixir
double = fn x ->
  x * 2
end

Enum.map([1,2,3], double)
```

Output:

```elixir
[2,4,6]
```

---

# Returning Functions

Functions can return functions.

Example:

```elixir
multiplier = fn factor ->
  fn value ->
    value * factor
  end
end
```

Usage:

```elixir
double = multiplier.(2)

double.(10)
```

Output:

```elixir
20
```

---

# Closures

Functions remember values from their environment.

Example:

```elixir
factor = 10

multiply = fn value ->
  value * factor
end
```

Usage:

```elixir
multiply.(5)
```

Output:

```elixir
50
```

The function remembers:

```elixir
factor
```

This is called a closure.

---

# Higher-Order Functions

A Higher-Order Function:

- Accepts another function
- Returns another function

Example:

```elixir
Enum.map()
```

It accepts a function.

```elixir
Enum.map(
  [1,2,3],
  fn x -> x * 2 end
)
```

Output:

```elixir
[2,4,6]
```

---

# Common Higher-Order Functions

## Map

Transform every element.

```elixir
Enum.map(
  [1,2,3],
  fn x -> x * 2 end
)
```

Output:

```elixir
[2,4,6]
```

---

## Filter

Keep matching elements.

```elixir
Enum.filter(
  [1,2,3,4,5],
  fn x -> rem(x,2) == 0 end
)
```

Output:

```elixir
[2,4]
```

---

## Reduce

Combine into a single value.

```elixir
Enum.reduce(
  [1,2,3,4],
  0,
  fn value, acc ->
    acc + value
  end
)
```

Output:

```elixir
10
```

---

# Function Composition

Small functions can be combined.

Example:

```elixir
double = fn x -> x * 2 end

increment = fn x -> x + 1 end
```

Conceptually:

```text
Input
 ↓
Double
 ↓
Increment
 ↓
Output
```

---

# Anonymous Functions

Anonymous functions do not require names.

Example:

```elixir
fn name ->
  "Hello #{name}"
end
```

Usage:

```elixir
greeting = fn name ->
  "Hello #{name}"
end

greeting.("Shivang")
```

Output:

```elixir
Hello Shivang
```

---

# Capturing Functions

Elixir provides a shorthand syntax.

Example:

```elixir
Enum.map(
  [1,2,3],
  &(&1 * 2)
)
```

Equivalent:

```elixir
Enum.map(
  [1,2,3],
  fn x ->
    x * 2
  end
)
```

---

# Functional Thinking Example

Suppose we need:

```text
Get active users
Extract names
Convert to uppercase
```

Functional solution:

```elixir
users
|> Enum.filter(& &1.active)
|> Enum.map(& &1.name)
|> Enum.map(& String.upcase(&1))
```

Each step transforms data.

No mutable state.

---

# Best Practices

### Prefer Pure Functions

Functions should depend only on inputs.

---

### Keep Functions Small

Good:

```elixir
validate_user()
```

```elixir
save_user()
```

Bad:

```elixir
process_everything()
```

---

### Avoid Side Effects

Prefer returning values rather than modifying external state.

---

### Compose Small Functions

Many small functions are better than one giant function.

---

# Common Mistakes

### Thinking Object-Oriented

Avoid:

```text
Create object
Mutate object
Save object
```

Think:

```text
Input
Transform
Output
```

---

### Large Functions

Large functions become difficult to test and maintain.

---

### Hidden State

Avoid depending on external variables when possible.

---

# Comparison with C#

C#

```csharp
users
    .Where(x => x.Active)
    .Select(x => x.Name)
    .ToList();
```

Elixir

```elixir
users
|> Enum.filter(& &1.active)
|> Enum.map(& &1.name)
```

---

C#

```csharp
Func<int,int> doubleIt = x => x * 2;
```

Elixir

```elixir
double = fn x -> x * 2 end
```

---

# Summary

In this chapter you learned:

- Functional Programming
- Immutability
- Pure Functions
- Impure Functions
- First-Class Functions
- Closures
- Higher-Order Functions
- Function Composition
- Functional Thinking

These concepts form the foundation of idiomatic Elixir code.

The next chapter is:

**05 - Recursion**

Recursion replaces traditional loops and is one of the most important concepts for understanding how Elixir processes collections internally.