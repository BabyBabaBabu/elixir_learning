# A basic script showcasing how to handle errors

# Errors (or exceptions) are used when exceptional things happen in the code
import Logger

try do
  :foo + 2
  raise "Ops!" # raise/1 or raise/2 e.g raise ErrorName, message: "the message"
rescue #
  e in ArithmeticError -> e # the e is an variable holding the exception you want to process/handle
end

# this construct is rarely used in Elixir
# most functions handle this automatically returning a tuple
# that contains info of success/failure of executing the function
# this can be used in a case construct with pattern matching

# Upon raising an exception and handling it, e.g logging it
# Use reraise, this raises the exception as is, without changing value or its origin
try do
  3 * :foo
rescue
  e ->
    Logger.error(Exception.format(:error, e, __STACKTRACE__))
    reraise e, __STACKTRACE__
end

# take errors in Elixir literally:
# they are reserved for unexpected and/or exceptional situations
# never for controlling the flow of our code.
# In case you actually need flow control constructs, "throw" should be used.

# In Elixir, a value can be thrown and later be caught.
try do
  Enum.each(-50..50, fn x ->
    if rem(x,13) == 0, do: throw(x) end)
  IO.puts("Got nothing")
catch
  x -> IO.puts("Got #{x}")
end

# When a process dies of “natural causes” (e.g., unhandled exceptions), it sends an exit signal
# exit signals are an important part of the fault tolerant system
# supervisor processes listen for exit signals
# Once an exit signal is received
# the supervision strategy kicks in and the supervised process is restarted.

try do
  IO.puts("Hello World")
  exit("I am exiting")
catch
  :exit, _ -> "Not really"
end

spawn_link( fn ->
  IO.puts("Hello World!")
  exit("Oops!") # returns ** (EXIT from #PID<0.116.0>) shell process exited with reason: "Oops!"
end)

# try/after
# ensure that a resource is cleaned up after some action that could potentially raise an error.

# e.g Open a file and use an after clause to close it – even if something goes wrong
# "after" clause will be executed regardless of whether or not the "try" block succeeds.
{:ok, file} = File.open("file.txt", [:write, :utf8])
try do
  IO.write(file, "Hola")
  raise "Oops, something went wrong!"
after
  File.close(file)
end

# use of raise, catch, after in a function body
# Will cause Elixir to automatically wrap the function body in a try
# prints the hello world, and the message in the after before raising the error
defmodule RunAfter do
  def try_this do
    IO.puts("Hello World")
    raise RuntimeError, message: "Oops,something went wrong :-("
  after
    IO.puts("Cleaning up...")
  end
end

# variables in try, catch, raise do & after blocks are locally scoped, they do not leak
