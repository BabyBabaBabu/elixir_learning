# A basic script to highlight the various basic operators in Elixir

# We've seen
IO.puts(10 * 2) # multiply
IO.puts(4 + 3) # add
IO.puts(6 / 4) # divide, returns float
IO.puts(5 - 3) # subtract

# for list we've seen
mylist = [1,2,4]
mynewlist = [3,4,5]
IO.puts(mylist ++ mynewlist) # concate, won't print anything in stdio but in iex it returns a new list combining both
IO.puts(mylist -- mynewlist) # subtract, won't print anything in stdio but in iex it returns a new list(less what exists in both and on the left of right)

# string concatenation
lname = "Kitaa"
fullname = "Alex " <> lname
IO.puts("Alex " <> "#{lname}")
IO.write("#{fullname}\n")

# Boolean operators, these expect something that evaluates to either true/false
IO.puts(true and false) # & operator, returns false, both need to be true
IO.puts(true or false) # or operator, returns true, one needs to be true
IO.puts(true and is_atom(:alex))

# Logical Operators, these allow arguments that are non-boolean, all arguments except false/nil will evaluate to ture
IO.puts(1 || true) # logical or, returns 1
IO.puts(2 && false) # logical and, returns false
IO.puts(!true) # logical not, negates the value
IO.puts(!nil) # logical not, negates the value, inverts it

# Structural comparison applies to the underlying data structures/data types

# Comparison operators
IO.puts(1 == "one") # equality comparison
IO.puts(2 != 'two') # non-equality comparison
IO.puts(2 <= 3) # less than or equal
IO.puts(20 >= 2) # greater than or equal
IO.puts(1<2) # less than
IO.puts(2>1) # greater than
IO.puts(1 === 1.0) # strict equality comparison for ints/floats, here returns false
IO.puts(1 !== 1.0) # strict non-equality comparison for ints/floats, here returns true
