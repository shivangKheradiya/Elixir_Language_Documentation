## Overview

This section introduces the core building blocks of Elixir. Before diving into OTP, GenServer, distributed systems, and backend development, it is important to understand the language fundamentals and the functional programming mindset that Elixir is built upon.

By the end of this chapter, you should be able to:

- Work comfortably in IEx
- Understand Elixir data types
- Create and use variables
- Work with strings, tuples, lists, and maps
- Define simple functions
- Create modules
- Understand immutability
- Read and write basic Elixir code

---

# Learning Objectives

After completing this chapter, you will be able to:

✅ Install and verify Elixir

✅ Use the Interactive Elixir Shell (IEx)

✅ Understand Elixir syntax

✅ Work with common data types

✅ Create and use modules

✅ Create anonymous functions

✅ Understand immutable data

✅ Write small reusable functions

---

# What is Elixir?

Elixir is a functional programming language built on top of the Erlang Virtual Machine (BEAM).

The BEAM runtime was designed for:

- Massive concurrency
- Fault tolerance
- Distributed computing
- High availability systems

Unlike traditional applications that rely heavily on operating system threads, Elixir uses lightweight processes managed by the BEAM runtime.

```text
C#        → CLR
Java      → JVM
Elixir    → BEAM
```

---

# Why Learn Elixir?

Elixir is particularly powerful for building:

- APIs
- Real-time systems
- Backend services
- Event-driven systems
- Distributed platforms
- Telemetry and monitoring systems
- High-concurrency applications

Key advantages:

- Functional programming
- Actor model concurrency
- Self-healing architecture
- Scalable process model
- Built-in distribution
- Mature runtime (BEAM)

---

# Development Environment

## Verify Installation

Check Elixir installation:

```bash
elixir --version
```

Example:

```bash
Erlang/OTP 27
Elixir 1.18.0
```

---

## Interactive Shell

Start IEx:

```bash
iex
```

Example:

```elixir
iex> 5 + 5
10
```

```elixir
iex> "Hello Elixir"
"Hello Elixir"
```

Exit:

```text
Ctrl + C
Ctrl + C
```

---

# Variables

Variables are created using the assignment operator.

```elixir
name = "Shivang"
age = 30
```

Accessing values:

```elixir
name
```

Output:

```elixir
"Shivang"
```

---

# Immutability

One of the most important concepts in Elixir is immutability.

When a value changes, a new binding is created instead of modifying the original value.

```elixir
count = 10

count = 20
```

This does not modify the original value.

Conceptually:

```text
count → 10

count → 20
```

Instead of changing data, Elixir creates new versions of data.

Benefits:

- Safer concurrent programs
- Predictable behavior
- No shared mutable state
- Easier debugging

---

# Basic Data Types

---

## Integer

```elixir
count = 100
```

---

## Float

```elixir
price = 99.95
```

---

## Boolean

```elixir
is_active = true
is_deleted = false
```

---

## Nil

Equivalent to null in many languages.

```elixir
value = nil
```

---

# Atoms

Atoms are constant values whose name is their value.

Examples:

```elixir
:ok
:error
:user
:connected
```

They are commonly used to represent states and outcomes.

Example:

```elixir
:ok
```

Very common pattern:

```elixir
{:ok, result}
```

```elixir
{:error, reason}
```

Examples:

```elixir
{:ok, "Saved"}
```

```elixir
{:error, "Not Found"}
```

---

# Strings

Strings are enclosed in double quotes.

```elixir
name = "Shivang"
```

---

## String Interpolation

```elixir
name = "Shivang"

"Hello #{name}"
```

Output:

```text
Hello Shivang
```

Comparison:

```csharp
$"Hello {name}"
```

```python
f"Hello {name}"
```

---

# Tuples

Tuples contain a fixed collection of values.

```elixir
person = {"Shivang", 30}
```

Retrieve values:

```elixir
elem(person, 0)
```

Output:

```elixir
"Shivang"
```

---

Common pattern:

```elixir
{:ok, data}
```

```elixir
{:error, message}
```

Example:

```elixir
{:ok, "User Created"}
```

---

# Lists

Lists are ordered collections.

```elixir
numbers = [1, 2, 3, 4, 5]
```

Head:

```elixir
hd(numbers)
```

Output:

```elixir
1
```

Tail:

```elixir
tl(numbers)
```

Output:

```elixir
[2, 3, 4, 5]
```

---

# Maps

Maps store key-value pairs.

```elixir
user = %{
  id: 1,
  name: "Shivang",
  city: "Madrid"
}
```

Access values:

```elixir
user.name
```

Output:

```elixir
"Shivang"
```

---

Alternative access:

```elixir
user[:name]
```

Output:

```elixir
"Shivang"
```

---

# Keyword Lists

Keyword lists are lists of tuples.

```elixir
config = [
  host: "localhost",
  port: 5432
]
```

Access:

```elixir
config[:host]
```

Output:

```elixir
"localhost"
```

Keyword lists are heavily used in:

- Phoenix
- Ecto
- Mix configuration

---

# Arithmetic Operators

## Addition

```elixir
10 + 5
```

---

## Subtraction

```elixir
10 - 5
```

---

## Multiplication

```elixir
10 * 5
```

---

## Division

```elixir
10 / 5
```

---

# Comparison Operators

```elixir
10 == 10
```

```elixir
10 != 5
```

```elixir
10 > 5
```

```elixir
10 < 5
```

```elixir
10 >= 5
```

```elixir
10 <= 5
```

---

# Anonymous Functions

Functions are first-class citizens in Elixir.

Create a function:

```elixir
add = fn a, b ->
  a + b
end
```

Execute:

```elixir
add.(10, 20)
```

Output:

```elixir
30
```

Notice the dot syntax:

```elixir
function.(arguments)
```

This is used for anonymous functions.

---

# Modules

Modules organize related functions.

Example:

```elixir
defmodule Calculator do
  def add(a, b) do
    a + b
  end
end
```

Execute:

```elixir
Calculator.add(10, 20)
```

Output:

```elixir
30
```

---

# Elixir Naming Conventions

## Module Names

Use PascalCase.

```elixir
UserService
OrderManager
AccountRepository
```

---

## Function Names

Use snake_case.

```elixir
get_user
create_order
validate_email
```

---

## Variables

Use snake_case.

```elixir
first_name
last_name
connection_string
```

---

# Best Practices

### Prefer Pattern Matching

Pattern matching is central to Elixir and should be preferred over complex conditional logic.

### Keep Functions Small

Functions should perform a single responsibility.

### Favor Immutable Data

Never think in terms of changing existing state.

### Return Explicit Results

Prefer:

```elixir
{:ok, result}
```

and

```elixir
{:error, reason}
```

instead of exceptions for expected outcomes.

---

# Common Mistakes

### Using Mutable Programming Concepts

Wrong mindset:

```text
Update object
Change value
Mutate state
```

Correct mindset:

```text
Create new value
Return new data
Transform data
```

---

### Overusing Tuples

Use tuples mainly for status responses.

Prefer maps for complex data structures.

---

### Ignoring Pattern Matching

Pattern matching is one of the most powerful features of Elixir and should be embraced early.

---

# Comparison with C#

| Elixir | C# |
|----------|----------|
| Atom | Enum Value |
| Tuple | Tuple |
| List | List<T> |
| Map | Dictionary<TKey,TValue> |
| Module | Static Class |
| Function | Method |
| Process | Thread/Task (conceptually) |
| BEAM | CLR |

---

# Summary

In this chapter we learned:

- What Elixir is
- Why Elixir is used
- Variables
- Immutability
- Atoms
- Strings
- Tuples
- Lists
- Maps
- Keyword Lists
- Functions
- Modules

These concepts form the foundation of every Elixir application.

The next chapter introduces one of the most important features of the language:

**02 - Pattern Matching**

Pattern Matching is the feature that makes Elixir fundamentally different from C#, Java, Python, and many other mainstream languages.
`