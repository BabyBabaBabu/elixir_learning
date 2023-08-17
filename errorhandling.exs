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
# In case you actually need flow control constructs, "throws" should be used.
