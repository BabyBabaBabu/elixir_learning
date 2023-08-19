# A basic script highlighting how to work with the Enums Module in ELixir

# Enumerables/Collections: lists & maps, ranges, they're data types that implement the Enumerable Protocol

# Enum
# The module provides functionality to group, sort, filter, retrieve & transform items from enumerables
# i.e values in data structures
# The functions are polymorphic, i.e work with diverse data types
# The functions are eager, they expect an enumerable & return a list
# For multiple operations, every intermediate operation returns a list until a result is reached

# Example
# function to check if integer is odd
odd? = &(rem(&1,2) != 0)
# square the values from the range, check if odd, sum the odd ones
1..100 |> Enum.map(&(&1 * &1)) |> Enum.filter(odd?) |> Enum.sum()
# here
# every Enum function, iterates through the elements in the enumerable & returns a list

# Streams
# The Stream module, an alternative to Enum
# Supports lazy loading compared to Enums
# Streams are lazy, composable enumerables.
# Stream operations return a data type
# A stream, an enumerable that generates elements one by one, e.g Range
# useful when working with large (or even infinite) collections
2..10 |> Stream.map(&IO.inspect(&1)) |> Stream.map(&(&1 * 2)) |> Stream.map(&IO.inspect(&1)) |> Enum.to_list()
# here, each element of the enumerable is run through the stream functions
# first print the element
# double the element
# print the doubled element
# The enum function at the end of the chain returns a list with the final results


# |> a pipe operator
# takes output from the left side & passes it as first agrument to the function on the right side
