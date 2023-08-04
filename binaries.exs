# A basic script on what binaries are in Elixir

# Elixir uses utf8 to encode strings
# utf8 encoding is variable length, using 1 to 4 bytes to store a codepoint
# A codepoint is a numeric index that represents a character,is stored in bytes

# A string is sequence of characters enclosed in double quotes, a utf8 encoded binary
# A binary is a bitstring whose bits are divisible by 8
# A bitstring is sequence of bits in memory, how elixir stores encoded bytes

IO.puts(<<104>>) # utf8 codepoint for string "h", prints "h"
string = "hello"
IO.inspect(string, binaries: :as_binaries) # prints a bitstring of the string's codepoints
IO.puts(String.length(string)) # returns no of characters, here 5
IO.puts(byte_size(string)) # determines no of bytes used to store each character, returns no. of bytes a string has, here 5, converts string to bitstring & determines bytes
IO.puts(is_bitstring(string)) # every string is a bitstring
IO.puts(is_binary(string)) # string is binary if bits divisible by 8

# charlist, a list of integers where all integers are valid codepoints
# found when interfacing with Erlang libraries
# use ~c, a sigil before the charlist
IO.puts(~c"hello") # indicates this isn't a string but a charlist
IO.puts('hello') # a charlist literal, by use of single quotes
IO.puts([99,97,116]) # prints cat, range of integers intepreted as ASCII charlist 0..127

IO.puts(to_string([99,97,116]))
IO.puts(to_charlist("hełło")) # in iex> returns [104, 101, 322, 322, 111]

# concatenation
IO.puts("he" <> "llo") # concates two strings, returns "hello", since strings are just binaries
IO.puts('he' ++ 'llo') # concates two charlist literals, returns 'hello'
