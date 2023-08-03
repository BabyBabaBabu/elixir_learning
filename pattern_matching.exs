# A basic script showcasing how = operator is a pattern matching operator
x = 1
IO.puts(x)
IO.puts(1 = x)
# IO.puts(2 = x) # returns MatchError

# Destructure complex types

# tuples, MatchError if tuple size don't match, or data types e.g matching a list to a tuple
{a,b,c} = {1,2,3}
IO.puts(a)
IO.puts(b)
IO.puts(c)

# Match on specific values
{:ok, result} = {:ok, 12}
IO.puts(result)

# lists
[a,b,c] = ["alex", 27, :male]
IO.puts(a)
IO.puts(b)
IO.puts(c)
[head | tail ] = ["alex", 27, :male] # matching using head & tail functions,
IO.puts(head)
mylist = [:male, 27]
mynewlist = ["alex"| mylist] # can also be used to prepend elements to a list
IO.puts(hd mynewlist)

# Pin operator
# guards against rebinding variables, can be used inside tuples,lists
x = 1
x = "Kitaa"
IO.puts(x)
# ^x = :male
#IO.puts(x) # raises a MatchError, x is already bound to "Kitaa"

# y = "Kyalo"
# [^y,z,a] = ["Alex", 27, :male] # Throws a MatchError
# IO.puts(y)
# IO.puts(z)
# IO.puts(a)
{m,n} = {2,3}
# {o,^m} = {4,5} # Throws a MatchError
IO.puts(m)
IO.puts(n)
# IO.puts(o)

[j,k] = [6,7]
[j,k] = [9,0]
IO.puts(j)
IO.puts(k)
# [j,j] = [8,9] # variable mentioned more than once should reference the same value, else, MatchError
# IO.puts(j) # Throws a MatchError

# Underscore _ to ignore a value of an element in a pattern
# _ can never be read from, any attempt throws CompileError
[head | _] = [1,2,3]
IO.puts(head)

# Cannot invoke a function on the left side of a pattern match
mylist = [1,3,4]
# length mylist = 3 # throws an ArgumentError
IO.puts(3 = length mylist)
