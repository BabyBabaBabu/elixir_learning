# A basic intro to data types in Elixir for quick recap
# NOTE: though not exhaustive , it serves as a pointer to basic data types in elixir

# integer arithmetics * + / - div() rem()
IO.puts(10 * 2)
IO.puts(4 + 3)
IO.puts(6 / 4) # returns float
IO.puts(5 - 3)
IO.puts(div(6,4))
IO.puts(rem(6,4)) # returns remainder
IO.puts(trunc(6 / 4)) # returns integer part of the float
IO.puts(round(6 / 4)) # rounds off the float to nearest integer

# notations for binary, octal & hexadecimal
IO.write("0b1010 is 10 in binary\n") # write/2 is similar to puts/2, doesn't add newline at the end
IO.puts("0o12 is 10 in octal")
IO.puts("0xA is \xF in hexadecimal")

# floats
IO.puts(1.9e-1) # float with exponent e-1 for scientific calculations

# booleans
IO.puts(true == false)

# Atoms a constant whose value is its name
IO.puts(:alex)
IO.puts(:alex == "alex")

# strings
IO.puts("Alex")
name = "Kitaa"
IO.puts("Alex #{name}") # interpolation
IO.puts(byte_size(name)) # returns no. of chars i.e 8bits = 1char ~ 8bits = 1byte, our case 5 chars/bytes
IO.puts(String.length("'Alex'")) # returns 6 i.e ' is a char, String is a whole module
IO.puts(String.upcase("kyalo")) # sample function in String module
IO.puts('hello' == "hello")

# Functions
sum = fn a,b -> a + b end # define anonymous function and store in variable sum
IO.puts(sum.(2,3)) # invoked/called by using the dot between variable and parentheses
# function arity is no. of arguments it needs eg func/2,  needs to be supplied with two args
# to see usage/docs of a function run in iex> h func/arity

# testing a value type
IO.puts(is_boolean(false))
IO.puts(is_integer(2))
IO.puts(is_float(2.3))
IO.puts(is_atom(:ok))
IO.puts(is_binary("Alex")) # strings a sequence of bytes know as binaries
IO.puts(is_binary('Alex')) # "string" 'char'
IO.puts(is_function(sum))

# Linked List ->stored in memory as linkedlists ie each element holds its value and pointer to next list element
mylist = [1,2,3]
IO.puts( length mylist) # returns no. of elements in list
mylist ++ [3,4,6] # returns [1,2,3,3,4,6], a new list
mylist -- [2,3,4] # returns [1,2], a new list
IO.puts(hd(mylist))
IO.puts(tl(mylist))
IO.puts( [104, 101, 108, 108, 111] ) # interpreted as printable ASCII Characters, a list of chars

# Tuples ->stored contiguously/adjacent in memory, access by index, zero-based index
mytuple = {:ok, "awesome"}
IO.puts( tuple_size(mytuple))
put_elem(mytuple, 1, "world") # modifies tuple element at location in index 1, returns {:ok, world}, a new tuple
IO.puts(elem(mytuple, 1)) # returns element in index 1 of tuple
