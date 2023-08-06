# A basic script on recursion in elixir

# Since data structures are immutable for functional languages, we rely on recursion, no data is mutated.
# A function is called recursively until a condition is met.
# For a function with multiple clauses, the clause whose conditions match what arguments were passed is executed

defmodule Recurse do
  def print_until(msg,count \\ 0)

  def print_until(msg,count) when count > 0 do
    IO.puts(msg)
    print_until(msg, count - 1)
  end

  def print_until(_msg, 0) do
    :ok
  end

end

Recurse.print_until("Hello",2)



defmodule Math do

  # A reduce algorithm
  # runs recursively through the elements in a list reducing the list into one value
  # An example, summing the elements in a list
  def sum_list([head | tail], accumulator) do
    sum_list(tail, head + accumulator)
  end

  def sum_list([], accumulator) do
    accumulator
  end

  # A map algorithm
  # runs through the elements in a list and map them over
  # An example, square each element in a list
  def square([head | tail]) do
    [head * head | square(tail)]
  end

  def square([]) do
    []
  end

end

IO.puts(Math.sum_list([1,2,3],0))
IO.puts(Math.square([1,2,3])) # run in iex> Math.square([1,2,3]), returns [1,4,9]

# Enum Module provides for many conveniences for working with lists

Enum.reduce([3,4,5],0,&(&1 + &2)) # similar to the sum of list function above
Enum.reduce([3,4,5],0,&+/2) # similar to the Math.sum_list function above, captures the + operator
Enum.map([3,4,5],&( &1 * &1)) # similar to the Math.square function above
