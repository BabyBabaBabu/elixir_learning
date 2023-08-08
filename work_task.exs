# A basic script on tasks in Elixir

# Tasks build on top of spawn/1 & spawn_link/1
# Provide better error report 7 introspection
# Task.start(func) instead of spawn
# Task.start_link(anonymous func) instead of spawn_link,
# Both return {:ok, pid}
# A task is started as part of supervision tree, a statically supervised task under a supervision tree

mypid = Task.start(fn -> IO.write("Hello World") end)
IO.puts("...from #{inspect(elem(mypid,1))}")
IO.puts("#{Process.alive?(elem(mypid,1))}")

# State
# For app that requires state, use processes
# Write processes that loop infintely, maintain state, read/write messages
defmodule MyListener do

  def start do
    Task.start_link(fn -> loop(%{}) end)
  end

  defp loop(map) do
    receive do
      {:get, key, caller} ->
        send(caller, Map.get(map, key))
        loop(map)
      {:put, key, value} ->
        loop(Map.put(map, key, value))
    end
  end

end

defmodule MyCalc do
  def listen()do
    Task.start_link(fn -> math(%{}) end)
  end

  defp math(map) do
    receive do
      {:square, val, value} ->
        math(Map.put(map, val, value*value))
      {:ans, val, caller} ->
        send(caller, Map.get(map, val))
    end
  end
end

# parent = self()
# {:ok, pid} = MyCalc.listen()
# send(pid, {:square, "value", 3})
# send(pid, {:ans, "value", parent})
# flush() , returns 9

# Register a process by running, Process.register(pid, :rcalc)
# usage, send(:rcalc, {:square, "value", 6})
# Use Elixir abstractions, e.g Agents, to do the above, i.e maintain state & register name,
# {:ok, pid} = Agent.start_link(fn -> %{} end)
# Agent.update(pid, fn map -> Map.put(map, "val", 6*6) end)
# Agent.get(pid, fn map -> Map.get(map, "val") end)
# Use GenServer to build generic servers
