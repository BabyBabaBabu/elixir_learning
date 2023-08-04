# A basic script on associative data structures in Elixir

# Ability to associate a key to a certain value is through keyword lists and maps

# Keyword lists
# A data structure that passes options to functions
# Keyword list is a list of 2-item tuple [{:trim, true}], an atom & and value
# rewritten [trim: true] i.e [{:trim, true}] == [trim: true], returns true
# If passed as the last argument to a function, skip the brackets

# A case: String.split/2 function, splitting a string of numbers
IO.puts(String.split("1  2  3  4  5", " ")) # in iex returns a list ["1", "", "2", "", "3", "", "4", "", "5"]
IO.puts(String.split("1  2  3  4  5", " ", [{:trim, true}])) # trim option set to true, clears empty strings
IO.puts(String.split("1  2  3  4  5", " ", trim: true))

# Being lists, you can use ++ to add values onto them
# keys can be given more than once thus existence of duplicates
# for duplicate keys, the first occurence is returned when reading
myklist = [a: 0, b: 1, d: 3]
myklist = myklist ++ [c: 3] # returns [a: 0, b: 1, d: 3, c: 2]
IO.puts(myklist[:c]) # reading a value in list use the key i.e an atom

# if...do blocks are syntax convenience on top of keywords
# this
# if myklist[:c] === 2 do
#   IO.puts("Found #{myklist[:c]}")
#  else IO.puts("Not found")
# end
# can be rewritten as, by including , & : where necessary
if myklist[:c] === 2, do: IO.puts("Found #{myklist[:c]}"), else: IO.puts("Not found")
# Keyword Module Exists to work with Keywords

# Maps
# To store key-value pairs use maps
# they allow any value as key & they don't follow any ordering

# syntax %{:key => value}
mymap = %{:a => 1, 2 => :b}
IO.puts(mymap[2])

# why maps are useful for pattern matching
%{:a => a} = mymap # will always match on a subset of the map
%{} = mymap # thus an empty map will match all maps
# %{:c => c} = mymap # will always  match as long as the key exists in a map, here a MatchError is thrown
# Map Module exists with functions for add, retrieve, update

mymap = Map.put(mymap, :c, 3)
IO.puts(Map.get(mymap, :c))
Map.to_list(mymap) # converts a map to a list

# Fixed key maps
# Contain predefined set of keys
# Useful when we know the shape of the data we are working
# all keys must be atoms, cannot be changed, removed,added, only the values they point to can be updated
user = %{:name => "Alex", :age => 27}
IO.puts(Map.get(user, :name))
# can be written as
user = %{name: "Kitaa", age: 27}
IO.puts(user.name) # access via Map.key, returns "Kitaa"

# Nested Data structures
users = [
  alex: %{name: "Alex", age: 27, languages: ["Erlang", "F#", "Elixir"]},
  james: %{name: "James", age: 32, languages: ["Scala", "Haskel", "Elixir"]}
] # here, a keyword list of 2-item tuple, an atom & value, where value is a map that contains one value i.e a list

# to access a value such as age above,
# access myklist[key], that returns a map, then map.key
IO.puts(users[:alex].languages)

# to manipulate nested data structures
# use macro put_in/2 & update_in/2
# put_in/2
users = put_in(users[:james].age, 30) # update the age
IO.puts(users[:james].age) # pull the updated age
# update_in/2
# allows passing of function to control how to manipulate the nested data structure
users = update_in(users[:james].languages, fn languages -> List.delete(languages, "Scala") end)
IO.puts(users[:james].languages) # pull the list of languages
