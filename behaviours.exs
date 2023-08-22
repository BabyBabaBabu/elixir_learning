# A basic script to showcase working with behaviours in Elixir

# Behaviours
#  define a set of functions that have to be implemented by a module
#  ensure that a module implements all the functions in that set.
# Think of behaviours like interfaces in object oriented languages
# behaviours are independent of the type/data.

# Example

defmodule Parser do
  @doc """
    Parse a string
  """
  @callback parse(String.t) :: {:ok, term } | {:error, atom}

  @doc """
    Lists all supported extensions
  """
  @callback extension() :: [String.t]

end

defmodule JSONParser do
  @behaviour Parser

  @impl Parser
  def parse(str) do
    {:ok, "some json" <> str}
  end

  @impl Parser
  def extension do
    [".json"]
  end

end


defmodule CSVParser do
  @behaviour Parser

  @impl Parser
  def parse(str) do
    {:ok, "some csv" <> str}
  end

  @impl Parser
  def extension do
    [".csv"]
  end
end
