# 06 - Enum & Collections

## Overview

Working with collections is one of the most common tasks in Elixir applications.

Although recursion is the foundation of collection processing, Elixir developers typically use the `Enum` module because it provides a clean, readable, and expressive API.

Most business logic in Elixir applications involves transforming collections using:

- map
- filter
- reduce
- find
- sort
- group_by

Mastering Enum is essential before moving into Processes, OTP, and GenServer.

---

# Learning Objectives

After completing this chapter, you will be able to:

✅ Work with Lists

✅ Work with Maps

✅ Use Enum functions

✅ Transform collections

✅ Filter collections

✅ Aggregate data

✅ Search collections

✅ Group and sort data

✅ Write idiomatic Elixir

---

# What is Enum?

Enum is a module that provides functions for working with collections.

Think:

```text
C# LINQ
    ≈
Elixir Enum
```

Common operations:

```text
Map
Filter
Reduce
Find
Sort
Group
Count
```

---

# List Review

Example:

```elixir
numbers = [1, 2, 3, 4, 5]
```

Lists are the most commonly used collection type.

---

# Enum.map

Transforms every item.

Example:

```elixir
Enum.map(
  [1, 2, 3],
  fn x -> x * 2 end
)
```

Output:

```elixir
[2, 4, 6]
```

---

# Using Capture Syntax

Example:

```elixir
Enum.map(
  [1, 2, 3],
  &(&1 * 2)
)
```

Output:

```elixir
[2, 4, 6]
```

---

# Enum.filter

Keeps only matching values.

Example:

```elixir
Enum.filter(
  [1,2,3,4,5,6],
  fn x ->
    rem(x, 2) == 0
  end
)
```

Output:

```elixir
[2,4,6]
```

---

# Enum.reject

Opposite of filter.

Example:

```elixir
Enum.reject(
  [1,2,3,4,5,6],
  fn x ->
    rem(x,2) == 0
  end
)
```

Output:

```elixir
[1,3,5]
```

---

# Enum.reduce

Combines all values into one.

Example:

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

# Enum.sum

Common shortcut.

Example:

```elixir
Enum.sum([1,2,3,4])
```

Output:

```elixir
10
```

---

# Enum.count

Count collection items.

Example:

```elixir
Enum.count([1,2,3,4])
```

Output:

```elixir
4
```

---

# Enum.find

Find first matching item.

```elixir
Enum.find(
  [1,2,3,4,5],
  fn x ->
    x > 3
  end
)
```

Output:

```elixir
4
```

---

# Enum.any?

Checks if any item matches.

```elixir
Enum.any?(
  [1,2,3,4],
  fn x ->
    x > 3
  end
)
```

Output:

```elixir
true
```

---

# Enum.all?

Checks if all items match.

```elixir
Enum.all?(
  [2,4,6],
  fn x ->
    rem(x,2) == 0
  end
)
```

Output:

```elixir
true
```

---

# Enum.sort

Sort values.

```elixir
Enum.sort([5,3,2,1,4])
```

Output:

```elixir
[1,2,3,4,5]
```

---

# Custom Sort

```elixir
Enum.sort(
  [5,3,2,1,4],
  &>=/2
)
```

Output:

```elixir
[5,4,3,2,1]
```

---

# Enum.uniq

Remove duplicates.

```elixir
Enum.uniq(
  [1,1,2,2,3,3]
)
```

Output:

```elixir
[1,2,3]
```

---

# Working with Maps

Example:

```elixir
users = [
  %{id: 1, name: "John"},
  %{id: 2, name: "Shivang"},
  %{id: 3, name: "Karen"}
]
```

---

# Extract Data

```elixir
Enum.map(
  users,
  fn user ->
    user.name
  end
)
```

Output:

```elixir
["John", "Shivang", "Karen"]
```

---

# Filter Maps

```elixir
Enum.filter(
  users,
  fn user ->
    user.id > 1
  end
)
```

---

# Enum.group_by

Group records.

```elixir
users = [
  %{name: "John", country: "UK"},
  %{name: "Karen", country: "Spain"},
  %{name: "Mike", country: "UK"}
]
```

```elixir
Enum.group_by(
  users,
  & &1.country
)
```

Output:

```elixir
%{
  "UK" => [...],
  "Spain" => [...]
}
```

---

# Enum.chunk_every

Split collection into chunks.

```elixir
Enum.chunk_every(
  [1,2,3,4,5,6],
  2
)
```

Output:

```elixir
[
  [1,2],
  [3,4],
  [5,6]
]
```

---

# Enum Pipeline

Real-world style.

```elixir
[1,2,3,4,5]
|> Enum.filter(& (rem(&1,2) == 1))
|> Enum.map(& (&1 * 10))
|> Enum.sum()
```

Execution:

```text
Filter Odds
      ↓
Multiply
      ↓
Sum
```

Result:

```elixir
90
```

---

# Real Example

Imagine a user list:

```elixir
users = [
  %{name: "John", active: true},
  %{name: "Karen", active: false},
  %{name: "Shivang", active: true}
]
```

Get active names:

```elixir
users
|> Enum.filter(& &1.active)
|> Enum.map(& &1.name)
```

Output:

```elixir
["John", "Shivang"]
```

---

# Best Practices

### Prefer Pipelines

Readable:

```elixir
data
|> Enum.filter(...)
|> Enum.map(...)
```

---

### Use Enum Before Writing Recursion

Prefer:

```elixir
Enum.sum(list)
```

Rather than custom recursive implementations.

---

### Keep Transformations Small

Each pipeline stage should do one thing.

---

### Use Meaningful Variable Names

Avoid:

```elixir
x
y
z
```

Prefer:

```elixir
user
order
product
```

---

# Common Mistakes

### Large Pipelines

Break large pipelines into smaller functions.

---

### Nested Enum Calls

Avoid deeply nested transformations.

---

### Premature Optimization

Enum is usually sufficient.

Stream will be discussed later for large datasets.

---

# Comparison with C#

C#

```csharp
users
.Where(u => u.Active)
.Select(u => u.Name)
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
numbers.Sum()
```

Elixir

```elixir
Enum.sum(numbers)
```

---

# Summary

In this chapter you learned:

- Enum.map
- Enum.filter
- Enum.reject
- Enum.reduce
- Enum.find
- Enum.any?
- Enum.all?
- Enum.sort
- Enum.group_by
- Enum.chunk_every
- Collection Pipelines

Enum is one of the most frequently used modules in Elixir and forms the basis for most data-processing tasks.

The next chapter is:

**07 - Processes**

This is where Elixir begins to show its real power through lightweight concurrent processes running on the BEAM.