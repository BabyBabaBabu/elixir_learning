# A basic script on writing modules in Elixir
# A module is a grouping of functions, example of encountered modules: String, Keyword, Map, List

# To create a module use "defmodule" macro
# 1st letter uppercase
# To create a function use "def" macro
# 1st letter lowercase or underscore
# To create a prvate function use "defp" macro
# invoked locally in the within the Module

# write modules into files for compiling and reuse
# extension ".ex"
# compile by running elixirc, generates a ".beam" file, contains bytecode

# HOWTO organize Elixir projects
# _build - contains compile artifacts
# lib - contains source files, ".ex"
# test - contains test scripts, ".exs"
# for actual  projects, use "mix" a build tool

defmodule Math do
  def sum(a,b) do
    do_sum(a,b)
  end

  defp do_sum(a,b) do
    a + b
  end

  # multiple clauses function
  # clause one
  def zero?(0) do   # functions that return boolean have a trailing ? after function name
    true
  end
  # clause two
  def zero?(x) when is_integer(x) do
    false
  end

end

IO.puts(Math.sum(3,4))
IO.puts(Math.zero?(1))

# function capturing
# by using the & capture operator for named functions
# you can assign a named function to a variable
# you can also capture local/imported functions
mysum = &Math.sum/2
iszero = &Math.zero?/1
checkfunc = &is_function/1

IO.puts(is_function(mysum))
IO.puts(mysum.(1,2))
IO.puts(checkfunc.(iszero))
IO.puts(iszero.(0))

# capturing can also be used on operators
multiply = &*/2 # multiply operator
IO.puts(multiply.(2,3))

# capturing functions can also be used to create short functions
# &(function body)
name = "Alex"
greetings = &("Howdy #{&1}") # &1 is the first agrunment, we use #{} to interpolate the passed argument
IO.puts(greetings.(name))
IO.puts(greetings.("Kitaa"))

# another short function
# instead of modulo = fn a,b -> rem(a,b) end
modulo = &(rem(&1, &2))
IO.puts(modulo.(5,4))

# Function default arguments
# you can pass default arguments to functions, the arguments are evaluated at invocation not function definitio
# any expression can serve as a default argument
# declaration format: "argumentname \\ defaultvalue"

defmodule Greetings do
  def hello(name \\ "Pal") do
    IO.puts("Hello #{name}")
  end
end

Greetings.hello("Alex")
Greetings.hello() # will print with the default value

# for functions with multiple clauses
# declare function head with the defaults without a body
defmodule Concat do
  def join(a,b \\ nil, sep \\ " ")

  def join(a,b, _sep ) when is_nil(b) do # underscore is used to signal ignore the argument
    a
  end

  def join(a,b, sep) do
    a <> sep <> b
  end
end

IO.puts(Concat.join("Alex", "Kitaa"))
IO.puts(Concat.join("Alex"))
IO.puts(Concat.join("Alex", "Kitaa", " + "))
