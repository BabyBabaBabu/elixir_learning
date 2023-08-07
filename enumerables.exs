# A basic script highlighting how to work with the Enums Module in ELixir
# Enumerables/Collections: lists & maps, ranges, they're data types that implement the Enumerable Protocol
# The modules provides functionality to group, sort, filter, retrieve & transform items from enumerables, i.e values in data structures
# The functions are polymorphic, i.e work with diverse data types
# The functions are eager, they expect an enumerable & return a list
# For multiple operations, every intermediate operation returns a list until a result is reach

odd? = &(rem(&1,2) != 0) # function to check if integer is odd
1..100 |> Enum.map(&(&1 * &1)) |> Enum.filter(odd?) |> Enum.sum() # square the values from the range, check if odd, sum the odd ones

# |> a pipe operator
# takes output from the left side & passes it as first agrument to the function on the right side
