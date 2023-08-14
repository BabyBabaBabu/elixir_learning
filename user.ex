# A basic script to demonstrate how to work with structs in Elixir

# structs are extensions built on top of maps
# they provide compile-time checks, and default values

# struct takes the name of the module as its name

defmodule User do
  @enforce_keys [:name] # to make sure a key is supplied with a value, else ArgumentError is thrown
  defstruct [:email, name: "Alex", age: 27] # email here can be nil, has to be specified first,else SyntaxError occurs
end

# iex> %User{}
jane = %User{ name: "Jane"} # returns %User{email: nil, name: "Jane", age: 27}
IO.puts(jane.age)  #returns 27
# jane = %{jane | age: 30, email: "jane@example.com"}, update the age key with value 30 & email with jane@example.com
IO.puts(is_map(jane)) # returns true, shows that a struct is a map
IO.puts(inspect Map.keys(jane)) #returns [:name, :__struct__, :email, :age]
# The  field :__struct__ uniquely identifys the map as a struct and holds the name of the struct
IO.puts(jane.__struct__) #returns Elixir.User
# jane = Map.from_struct(jane), converts struct jane to a map, returns %{name: "Jane", email: "jane@example.com", age: 30}
# is_struct(jane), returns false
