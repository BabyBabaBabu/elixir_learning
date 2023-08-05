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
  # functions that return boolean have a trailing ? after function name
  # clause one
  def zero?(0) do
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
checkfunc = &is_function/1

mysum = &Math.sum/2
iszero = &Math.zero?/2

IO.puts(is_function(mysum))
IO.puts(mysum.(1,2))
IO.puts(checkfunc.(iszero))

# capturing can also be used on operator
multiply = &*/2
IO.puts(multiply.(2,3))

# capturing functions can also be used to create short functions
name = "Alex"
greetings = &("Howdy #{&1}") # &1 is the first agrunment, we use #{} to interpolate the passed argument
IO.puts(greetings.(name))
IO.puts(greetings.("Kitaa"))

modulo = &(rem(&1, &2))
IO.puts(modulo.(5,4))
