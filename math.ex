defmodule Math do
  #define a constant using the @
  @mydub 2
  # function call to assign a value to a constant
  @my_address URI.parse("https://example.com")

  #
  @moduledoc """
  Some basic Math functions

  ## Examples
      iex> Math.modulo(4, 3)
          1

      iex> Math.square(2)
          4

  """

  @doc """
  Calculates the square of any number you pass it
    ## Example
      iex> Math.square(4)
          16

  """
  def square(num) do
    num*num
  end

  @doc """
    Calculates the remainder of a division

    ## Example
      iex> Math.modulo(4, 3)
          1

  """
  def modulo(num1,num2) do
    rem(num1,num2)
  end

    @doc """
    Doubles any integer you pass it

    ## Example
      iex> Math.double(3)
          6

  """
  def double(num) do
    num* @mydub
  end

  def myfunc do
    IO.puts("Accessing #{@my_address.authority} on port #{@my_address.port} ")
  end

end
