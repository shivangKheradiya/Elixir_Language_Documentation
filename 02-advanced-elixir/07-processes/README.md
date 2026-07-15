# 07 - Processes

## Overview

Processes are the foundation of concurrency in Elixir.

Unlike operating system processes or threads, Elixir processes are extremely lightweight and are managed by the BEAM virtual machine.

Everything that makes Elixir powerful eventually comes back to processes:

- Concurrency
- Fault Tolerance
- OTP
- GenServer
- Phoenix
- Distributed Systems

Understanding processes is one of the most important steps in becoming proficient with Elixir.

---

# Learning Objectives

After completing this chapter, you will be able to:

✅ Understand Elixir Processes

✅ Create Processes

✅ Send Messages

✅ Receive Messages

✅ Understand Process IDs (PIDs)

✅ Understand Mailboxes

✅ Understand the Actor Model

✅ Build Basic Concurrent Programs

---

# What is a Process?

An Elixir process is a lightweight unit of execution managed by the BEAM.

Think of it as:

```text
Elixir Process
    ≠
Operating System Process
```

An Elixir application can run:

```text
Thousands
Hundreds of Thousands
Millions
```

of processes simultaneously.

---

# Process Characteristics

Processes are:

- Lightweight
- Independent
- Concurrent
- Isolated
- Fault Tolerant

Each process:

- Has its own memory
- Has its own mailbox
- Does not share state

---

# Why No Shared Memory?

Traditional systems often use:

```text
Threads
Locks
Mutexes
Semaphores
```

to protect shared data.

Elixir avoids this problem.

Processes communicate by sending messages.

```text
Process A
    ↓
 Message
    ↓
Process B
```

No shared memory.

No locks.

---

# Actor Model

Elixir follows the Actor Model.

Each process:

```text
Receives Messages
Processes Messages
Returns Results
Maintains State
```

Actors communicate only through messages.

This simplifies concurrent programming significantly.

---

# Creating a Process

Use:

```elixir
spawn/1
```

Example:

```elixir
spawn(fn ->
  IO.puts("Hello from process")
end)
```

Output:

```text
Hello from process
```

---

# Process ID (PID)

Every process has a unique identifier.

Example:

```elixir
pid =
  spawn(fn ->
    :timer.sleep(5000)
  end)

IO.inspect(pid)
```

Output:

```text
#PID<0.123.0>
```

---

# Current Process

Get the current PID.

```elixir
self()
```

Example:

```elixir
IO.inspect(self())
```

Output:

```text
#PID<0.96.0>
```

---

# Sending Messages

Use:

```elixir
send(pid, message)
```

Example:

```elixir
pid =
  spawn(fn ->
    receive do
      msg ->
        IO.puts("Received: #{msg}")
    end
  end)

send(pid, "Hello")
```

Output:

```text
Received: Hello
```

---

# Receiving Messages

Messages are received using:

```elixir
receive
```

Example:

```elixir
receive do
  message ->
    IO.inspect(message)
end
```

The process waits until a matching message arrives.

---

# Mailbox

Every process owns a mailbox.

Messages arrive in the mailbox.

```text
Mailbox

Message 1
Message 2
Message 3
```

The process consumes messages one at a time.

---

# Message Pattern Matching

Messages can be pattern matched.

Example:

```elixir
receive do

  {:user, name} ->
    IO.puts(name)

  {:error, reason} ->
    IO.puts(reason)

end
```

Messages:

```elixir
send(pid, {:user, "Shivang"})
```

Output:

```text
Shivang
```

---

# Process Communication

Process A:

```elixir
send(pid, {:greeting, "Hello"})
```

Process B:

```elixir
receive do
  {:greeting, message} ->
    IO.puts(message)
end
```

Processes communicate only through messages.

---

# Process Loop

A process that handles one message exits.

To keep it alive we use recursion.

Example:

```elixir
def loop do
  receive do
    message ->
      IO.inspect(message)
      loop()
  end
end
```

This is the foundation of:

```text
OTP
GenServer
Phoenix Channels
```

---

# Process Lifecycle

```text
Start
  ↓
Receive Message
  ↓
Process Message
  ↓
Wait Again
```

Or:

```text
Start
  ↓
Receive Message
  ↓
Exit
```

---

# Timeout

Receive can specify a timeout.

Example:

```elixir
receive do
  message ->
    IO.inspect(message)
after
  3000 ->
    IO.puts("Timeout")
end
```

If no message arrives:

```text
Timeout
```

is executed.

---

# Multiple Messages

Example:

```elixir
receive do

  {:add, a, b} ->
    IO.puts(a + b)

  {:subtract, a, b} ->
    IO.puts(a - b)

end
```

This resembles function pattern matching.

---

# Process State

Processes can hold state through recursion.

Example:

```elixir
def counter(count) do
  receive do

    :increment ->
      counter(count + 1)

    :print ->
      IO.puts(count)
      counter(count)

  end
end
```

This concept becomes a GenServer later.

---

# Why Processes Matter

Processes power:

- OTP
- GenServer
- Phoenix Channels
- LiveView
- Distributed Nodes

Almost every advanced Elixir concept is built on top of processes.

---

# Best Practices

### Communicate Through Messages

Prefer:

```elixir
send(pid, message)
```

over shared state.

---

### Pattern Match Messages

Use tuples.

```elixir
{:increment}
{:user, user}
{:error, reason}
```

---

### Keep Processes Focused

Each process should have a single responsibility.

---

### Build Small Actors

Small processes scale better than large ones.

---

# Common Mistakes

### Forgetting Receive

A process that never receives messages is rarely useful.

---

### Forgetting Recursion

Without recursion:

```elixir
receive do
  ...
end
```

handles only one message.

---

### Putting Too Much Logic in One Process

Prefer many small processes.

---

# Comparison with C#

C#

```csharp
Task.Run(() =>
{
    Console.WriteLine("Hello");
});
```

Elixir

```elixir
spawn(fn ->
  IO.puts("Hello")
end)
```

---

C#

```csharp
ConcurrentQueue<T>
```

Elixir

```text
Process Mailbox
```

---

C#

```csharp
lock(...)
{
}
```

Elixir

```text
Message Passing
```

No locks required.

---

# Summary

In this chapter you learned:

- Processes
- PIDs
- self()
- spawn()
- send()
- receive()
- Mailboxes
- Timeouts
- Process Loops
- Actor Model

Processes are the foundation of:

- Concurrency
- OTP
- GenServer
- Distributed Elixir

The next chapter is:

**08 - Concurrency**

where we will learn how multiple processes work together and how Elixir achieves massive scalability through lightweight concurrent execution.