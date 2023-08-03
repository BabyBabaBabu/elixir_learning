# A basic script on the case, cond, if control flow structures in Elixir

# case
# compares values against many in a pattern

# matching a variable
name = "Kitaa"
case name do
  "Kitaa" -> IO.puts("Hello")
  "Kyalo" -> IO.puts("Hey")
  "Alex" -> IO.puts("Howdy")
  _ -> IO.puts("Hi") # underscore used to match any other value
end

# name = "Kitaa"
case "Alex" do
  ^name -> IO.puts("Hello") # may use ^ point operator to prevent rebinding, thus match aginst an existing variable
  "Kyalo" -> IO.puts("Hey")
  "Alex" -> IO.puts("Howdy")
  _ -> IO.puts("Hi") # underscore used to many any other value
end

# matching a tuple, using guards
# guards augment pattern matching with more complex checks
# defined by using the 'when' operator and a guard expression
mytuple = {"Alex", 24, :male}

case elem(mytuple, 2) do
  :male when elem(mytuple,1) > 25  -> IO.puts("Sr Bachelor")
  :male when elem(mytuple,1) >= 20 -> IO.puts("Bachelor")
  :male when elem(mytuple,1) > 16  -> IO.puts("Jr Bachelor")
  _ -> IO.puts("Not a Bachelor")
end

# matching anonymous functions
# use of guards and mmultiple clauses
# ensure no. of args per clause is same
fun = fn
x,y when x>0 -> x+y
x,y -> x*y
end

IO.puts(fun.(1,2))
IO.puts(fun.(-2,2))

# cond
# check different conditions and find the first one that does not evaluate to nil or false
# any value besides false/nil is true
# if all evaluate to false an errow is thrown CondClauseError
cond do
  2+2 == 5 -> IO.puts("Evaluates to false")
  2*2 == 3 -> IO.puts("Also this")
  1+1 == 2 -> IO.puts("Evaluates to true")
end

#if
# executes body when condition evaluates to true
# if condition evaluates to false, return nil
# can pass else
if false do
  IO.puts("It doesn't work!")
else
  IO.puts("It works!")
end


#unless
# # if condition evaluates to false, execute
unless true do
  IO.puts("It won't be printed")
end

# to change a value return it rom the if
x=2

x = if true do
  x + x
else
  x
end
IO.puts(x)
