# A basic script on working with typespecs

# Type specs are notations for declaring

# typed function signatures/specifications

# To document function signatures, the data type a function accepts and returns
# function specs are written with the @spec attribute,
# typically placed immediately before the function definition
# the function and its input before the ::
# the return value after the ::
# Example
# round/1 # defined as @spec round(number()) :: integer()

# custom types

# custom types can help communicate the intention of your code and increase its readability
# Example, to provide a more descriptive alias of an existing type
# Can be defined within modules via the @type attribute.
# to document the type use @typedoc

# They're useful for code clarity and static code analysis

defmodule Person do
  @typedoc """
    A 4 digit year, e.g 1996
  """
  @type year :: integer

  @spec current_age(year) :: integer
  @doc """
    Calculate Person age based on year passed
  """
  def current_age(year) do
    current_year = Date.utc_today
    current_year.year - year
  end
end

# You can compound types as well. For example, a list of integers has type [integer]
# You can define compound custom types, e.g. maps
# to ensure the type is not accessible outside the module it's defined in use @typep

# custom compound type
defmodule LousyCalculator do

  @typedoc """
   Just a number followed by a lousy text
  """
  @type number_with_text :: {number, String.t}


  @doc """
    Returns the sum of two integers and some lousy text
  """
  @spec add(number, number) :: number_with_text
  def add(a, b) do
    {a + b, "You need a calculator for this?"}
  end

  @doc """
    Returns the product of two integers & some lousy text
  """
  @spec multiply(number, number) :: number_with_text
  def multiply(x,y) do
    {x * y, "Just an addition on steroids!"}
  end

end
