# A basic script highlighting how to work with processes in elixir

# All code in Elixir runs in processes
# Processes are isolated from each other, run concurrent to one another and communicate via message passing.
# Processes are the basis for concurreny & building fault-tolerant, distributed systems

# To spawn a new process, use spawn/1 function
spawn(fn -> 1 + 2 end) # spawn a function & return its PID,, the passed function will be executed in another process & exit once done
self() # returns PID of the currently running process
mypid = self()
status = Process.alive?(mypid) # checks if process is running
IO.puts(status) # prints true

# send & receive messages between processes
# send/2 send(process, message)
# message can be string, output from a function call

send(self(),inspect(mypid))#"Hello World")
# receive/1
# can run through clauses to match the message
receive do
 msg -> IO.puts("My PID is: #{msg}")
end

# inspect(), converts a data structure into a string for printing
IO.puts(inspect(spawn(fn -> 1 + 2 end))) # prints process id

send(self(), "Hello World")
receive do
  msg -> IO.puts(msg)
end

double = &(&1 * 2)
send(self(), double.(2))
send(self(), double.(4))
receive do
  msg -> IO.puts(msg)
end

# square = &(&1 * &1)
# send(self(), square.(3))
# send(self(), square.(4))
# receive do
#   msg -> IO.puts(msg)
# end

# flush(), flushes & prints all messages in the recepient's process mailbox
# flush(), will print 9,16, :ok
