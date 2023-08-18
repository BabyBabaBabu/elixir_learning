# A basic script on how to write protocols in Elixir

# Protocols
# mechanism to achieve polymorphism in Elixir
# when you want behaviour to vary depending on the data type
# allows us to extend the original behaviour for as many data types as we need

# use defprotocol ProtocolName
# Protocol implementations are defined using defimpl
# A protocols & functions and specs may look similar to interfaces or abstract base classes in other languages.

# defprotocol  Utils do
#   @spec type(t) :: String.t()
#   def type(value)
# end

# defimpl Utils, for: BitString do
#   def type(_value), do: "string"
# end

# defimpl Utils, for: Integer do
#   def type(_value), do: "integer"
# end

# defprotocol Size do
#   @doc "Calculates the size (and not the length!) of a data structure"
#   def size(data)
# end

# defimpl Size, for: BitString do
#   def size(string), do: byte_size(string)
# end

# defimpl Size, for: Map do
#   def size(map), do: map_size(map)
# end

# defimpl Size, for: Tuple do
#   def size(tuple), do: tuple_size(tuple)
# end

# deriving
# Elixir allows us to derive a protocol implementation based on the Any implementation

defmodule Male do
  @enforce_keys [:name]
  alias __MODULE__
  defstruct name: ""

  def new(name) do
    %Male{name: name}
  end
end

defmodule Female do
  @enforce_keys [:name]
  alias __MODULE__
  defstruct name: " "

  def new(name) do
    %Female{name: name}
  end
end

defmodule OtherGender do
  @derive[User]

  @enforce_keys [:name]
  defstruct name: " "

  def new(name) do
    %OtherGender{name: name}
  end
end

defprotocol User do
  @fallback_to_any true
  def greeting(args)
end

defimpl User, for: Male do
  def greeting(args), do: "Hello, I'm Mr #{args.name}"
end

defimpl User, for: Female do
  def greeting(args), do: "Hello, I'm Mr #{args.name}"
end

defimpl User, for: Any do
  def greeting(_), do: "Hello, I'm Non-binary"
end
