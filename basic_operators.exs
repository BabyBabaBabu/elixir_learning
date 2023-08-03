# A basic script to highlight the various arithmetic operations in Elixir

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
IO.write("#{fullname}")

# Boolean operators
