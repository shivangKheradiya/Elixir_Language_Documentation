# 02 - Pattern Matching

## Overview

Pattern Matching is one of the most important features of Elixir and is often considered the language's superpower.

Unlike traditional programming languages where the `=` operator performs assignment, Elixir uses it as a match operator.

Pattern matching allows developers to:

- Extract values from data structures
- Validate data shape
- Simplify conditional logic
- Eliminate boilerplate code
- Write expressive function definitions

Pattern matching is used everywhere in Elixir:

- Variables
- Functions
- Tuples
- Lists
- Maps
- Structs
- GenServers
- Phoenix
- Ecto
- OTP

Mastering pattern matching is essential before moving into OTP and GenServer development.

---

# Learning Objectives

After completing this chapter, you will be able to:

✅ Understand the match operator

✅ Extract values from tuples

✅ Extract values from lists

✅ Extract values from maps

✅ Use the pin operator

✅ Perform pattern matching in functions

✅ Understand multiple function clauses

✅ Read production Elixir code confidently

---

# Match Operator

In most programming languages:

```text
= means assignment
```

In Elixir:

```text
= means matching
```

Example:

```elixir
name = "Shivang"
```

The value matches the variable pattern.

---

# Simple Matching

```elixir
x = 10
```

Result:

```elixir
x => 10
```

---

# Matching Multiple Values

```elixir
{x, y} = {10, 20}
```

Result:

```elixir
x => 10
y => 20
```

---

# Tuple Matching

Tuples are commonly matched to extract values.

Example:

```elixir
{:ok, data} = {:ok, "User Found"}
```

Result:

```elixir
data => "User Found"
```

---

# Failed Match

```elixir
{:ok, value} = {:error, "Failed"}
```

Result:

```elixir
** (MatchError)
```

The pattern and data do not match.

---

# Common Tuple Pattern

Success Response:

```elixir
{:ok, user}
```

Error Response:

```elixir
{:error, reason}
```

Example:

```elixir
result = {:ok, "John"}

{:ok, name} = result
```

---

# List Matching

Lists can be split into:

- Head
- Tail

Example:

```elixir
[head | tail] = [1, 2, 3, 4]
```

Result:

```elixir
head => 1
tail => [2, 3, 4]
```

---

# Capturing Entire List

```elixir
[first, second, third] = [1, 2, 3]
```

Result:

```elixir
first => 1
second => 2
third => 3
```

---

# Nested Matching

```elixir
{:ok, %{name: name}} =
  {:ok, %{name: "Shivang"}}
```

Result:

```elixir
name => "Shivang"
```

---

# Map Matching

Maps allow partial matching.

Example:

```elixir
%{name: name} =
  %{name: "Shivang", city: "Madrid"}
```

Result:

```elixir
name => "Shivang"
```

Notice:

```elixir
city
```

does not need to be matched.

Only required keys are checked.

---

# Multiple Map Fields

```elixir
%{
  name: name,
  city: city
} = %{
  name: "Shivang",
  city: "Madrid",
  country: "Spain"
}
```

Result:

```elixir
name => "Shivang"
city => "Madrid"
```

---

# Ignoring Values

Use underscore when a value is not needed.

```elixir
{:ok, _} = {:ok, "something"}
```

Example:

```elixir
{_, age} = {"Shivang", 30}
```

Result:

```elixir
age => 30
```

---

# Pin Operator (^)

The pin operator prevents rebinding.

Without pin:

```elixir
x = 10

x = 20
```

Valid.

---

With pin:

```elixir
x = 10

^x = 10
```

Valid.

---

```elixir
x = 10

^x = 20
```

Result:

```elixir
** (MatchError)
```

Because x is already bound to 10.

---

# Pattern Matching in Functions

One of the most powerful uses of pattern matching.

Example:

```elixir
defmodule UserStatus do

  def get_message(:active) do
    "User is active"
  end

  def get_message(:inactive) do
    "User is inactive"
  end

end
```

Usage:

```elixir
UserStatus.get_message(:active)
```

Output:

```elixir
"User is active"
```

---

# Multiple Function Clauses

Instead of if/else:

```elixir
defmodule Math do

  def operation(:add, a, b) do
    a + b
  end

  def operation(:subtract, a, b) do
    a - b
  end

end
```

Usage:

```elixir
Math.operation(:add, 10, 5)
```

Output:

```elixir
15
```

---

# Pattern Matching with Lists

Example:

```elixir
defmodule ListHelper do

  def first([head | _tail]) do
    head
  end

end
```

Usage:

```elixir
ListHelper.first([10,20,30])
```

Output:

```elixir
10
```

---

# Pattern Matching with Maps

Example:

```elixir
defmodule User do

  def get_name(%{name: name}) do
    name
  end

end
```

Usage:

```elixir
User.get_name(%{
  id: 1,
  name: "Shivang"
})
```

Output:

```elixir
"Shivang"
```

---

# Why Pattern Matching Matters

Nearly every Elixir framework depends heavily on pattern matching.

Examples:

GenServer:

```elixir
handle_call(:count, _from, state)
```

Phoenix:

```elixir
{:ok, user}
```

Ecto:

```elixir
{:error, changeset}
```

Task:

```elixir
{:ok, result}
```

OTP:

```elixir
{:stop, reason, state}
```

If you understand pattern matching, much of Elixir becomes easy to read.

---

# Best Practices

### Match Early

Prefer:

```elixir
{:ok, user} = get_user()
```

instead of nested conditionals.

---

### Let Data Define Behavior

Use pattern matching in function heads whenever possible.

---

### Use Tuples for Status Responses

```elixir
{:ok, value}
{:error, reason}
```

is the standard Elixir convention.

---

### Ignore Unused Values

```elixir
{:ok, _}
```

instead of creating variables that are never used.

---

# Common Mistakes

### Treating = as Assignment

Wrong mindset:

```text
Store value
```

Correct mindset:

```text
Match pattern
```

---

### Forgetting Match Failures

This fails:

```elixir
{:ok, user} =
  {:error, "Not Found"}
```

Always ensure the expected pattern exists.

---

### Overusing Conditional Logic

Many if/else blocks can be replaced with function pattern matching.

---

# Comparison with C#

C#:

```csharp
if(result.Success)
{
    return result.Data;
}
```

Elixir:

```elixir
{:ok, data} = result
```

---

C#:

```csharp
switch(status)
{
    case "active":
}
```

Elixir:

```elixir
def get_status(:active)
```

---

# Summary

In this chapter you learned:

- Match Operator
- Tuple Matching
- List Matching
- Map Matching
- Nested Matching
- Pin Operator
- Function Pattern Matching
- Multiple Function Clauses

Pattern Matching is the foundation of:

- OTP
- GenServer
- Ecto
- Phoenix
- Distributed Elixir

The next chapter introduces:

**03 - Modules & Functions**

where we learn how Elixir applications are structured and how reusable functionality is organized.