# 03 - Modules & Functions

## Overview

Modules and Functions are the fundamental building blocks of every Elixir application.

If Pattern Matching is Elixir's superpower, then Modules and Functions are the mechanisms used to organize business logic.

Everything in Elixir is organized into modules containing functions.

Examples:

- Phoenix Controllers
- Ecto Schemas
- GenServers
- OTP Workers
- Business Services

All are implemented as modules.

Understanding modules and functions is essential before moving into recursion, processes, and OTP.

---

# Learning Objectives

After completing this chapter, you will be able to:

✅ Create modules

✅ Create public functions

✅ Create private functions

✅ Use default arguments

✅ Use guard clauses

✅ Organize business logic

✅ Write reusable code

✅ Follow Elixir naming conventions

---

# What is a Module?

A module is a container for related functions.

Example:

```elixir
defmodule Calculator do
end
```

Equivalent concept:

```text
Elixir Module
    ≈
C# Class
```

Unlike C#, there are no objects.

Modules simply group functions together.

---

# Creating a Module

Example:

```elixir
defmodule Calculator do

  def add(a, b) do
    a + b
  end

end
```

Usage:

```elixir
Calculator.add(10, 20)
```

Output:

```elixir
30
```

---

# Public Functions

Public functions are defined using:

```elixir
def
```

Example:

```elixir
defmodule UserService do

  def get_name do
    "Shivang"
  end

end
```

Usage:

```elixir
UserService.get_name()
```

---

# Private Functions

Private functions can only be called from within the same module.

Definition:

```elixir
defp
```

Example:

```elixir
defmodule UserService do

  def get_message(name) do
    format_message(name)
  end

  defp format_message(name) do
    "Hello #{name}"
  end

end
```

Valid:

```elixir
UserService.get_message("Shivang")
```

Invalid:

```elixir
UserService.format_message("Shivang")
```

---

# One-Line Functions

Simple functions can use shorthand syntax.

Example:

```elixir
defmodule Math do

  def add(a, b), do: a + b

end
```

Usage:

```elixir
Math.add(5, 10)
```

Output:

```elixir
15
```

---

# Multiple Functions

Modules can contain many functions.

```elixir
defmodule Calculator do

  def add(a, b), do: a + b

  def subtract(a, b), do: a - b

  def multiply(a, b), do: a * b

end
```

---

# Function Arity

In Elixir, functions are identified by:

```text
Name + Number of Arguments
```

This is called arity.

Example:

```elixir
def hello() do
  "Hello"
end

def hello(name) do
  "Hello #{name}"
end
```

Functions:

```text
hello/0
hello/1
```

These are different functions.

---

# Default Arguments

Default values can be assigned to parameters.

Example:

```elixir
defmodule User do

  def greet(name \\ "Guest") do
    "Hello #{name}"
  end

end
```

Usage:

```elixir
User.greet()
```

Output:

```elixir
Hello Guest
```

Usage:

```elixir
User.greet("Shivang")
```

Output:

```elixir
Hello Shivang
```

---

# Guard Clauses

Guards allow additional conditions during pattern matching.

Example:

```elixir
defmodule NumberChecker do

  def positive?(number)
      when number > 0 do
    true
  end

  def positive?(_) do
    false
  end

end
```

Usage:

```elixir
NumberChecker.positive?(10)
```

Output:

```elixir
true
```

---

# Multiple Function Clauses

Pattern matching can be combined with functions.

Example:

```elixir
defmodule Status do

  def message(:active) do
    "User Active"
  end

  def message(:inactive) do
    "User Inactive"
  end

end
```

Usage:

```elixir
Status.message(:active)
```

Output:

```elixir
User Active
```

---

# Module Attributes

Module attributes are often used for constants.

Example:

```elixir
defmodule Config do

  @app_name "Elixir Learning"

  def app_name do
    @app_name
  end

end
```

Usage:

```elixir
Config.app_name()
```

Output:

```elixir
Elixir Learning
```

---

# Documentation

Functions can be documented using:

```elixir
@doc
```

Example:

```elixir
defmodule Calculator do

  @doc "Adds two numbers"
  def add(a, b) do
    a + b
  end

end
```

---

# Naming Conventions

## Module Names

PascalCase

```elixir
UserService
AccountManager
OrderProcessor
```

---

## Function Names

snake_case

```elixir
get_user
create_order
delete_account
```

---

## File Names

snake_case

```text
user_service.ex
account_manager.ex
```

---

# Organizing Business Logic

Bad:

```elixir
Everything inside one module
```

Good:

```text
UserService
OrderService
EmailService
PaymentService
```

Keep modules focused on a single responsibility.

---

# Best Practices

### Keep Functions Small

Prefer:

```elixir
create_user()
```

instead of huge functions with many responsibilities.

---

### Prefer Pure Functions

Functions should depend only on inputs and outputs whenever possible.

---

### Use Private Functions

Expose only the public API.

Hide implementation details using:

```elixir
defp
```

---

### Leverage Pattern Matching

Prefer multiple function clauses over long conditional blocks.

---

# Common Mistakes

### Creating Large Modules

Avoid:

```text
God Modules
```

with hundreds of functions.

---

### Exposing Everything Publicly

Use:

```elixir
defp
```

for internal helper functions.

---

### Ignoring Function Arity

Remember:

```text
hello/0
hello/1
```

are different functions.

---

# Comparison with C#

C#

```csharp
public class Calculator
{
    public int Add(int a, int b)
    {
        return a + b;
    }
}
```

Elixir

```elixir
defmodule Calculator do
  def add(a, b) do
    a + b
  end
end
```

---

# Summary

In this chapter you learned:

- Modules
- Public Functions
- Private Functions
- Function Arity
- Default Arguments
- Guard Clauses
- Multiple Function Clauses
- Module Attributes
- Documentation

Modules and Functions form the foundation of all Elixir applications.

The next chapter introduces:

**04 - Functional Programming**

where we'll learn the mindset required for writing idiomatic Elixir.