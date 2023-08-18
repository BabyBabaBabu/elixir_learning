# A basic script highlighting the use of module attributes to document modules
# Elixir treats documentation as first-class and provides many functions to access documentation.
# Annotate the module
# use @moduledoc
# Annotate functions in a module
# use @doc

defmodule Math do

  @moduledoc """
  Some basic Math functions

  ## Examples
      iex> Math.modulo(4, 3)
          1

      iex> Math.square(2)
          4
  """
  # define a constant using the @constant_name
  # to make a value more visible or reusable
   @mydub 2

  # May want to accumulate values passed to a module attribute
  # use Module.register_attribute & set accumulate: true for the attribute
  Module.register_attribute(__MODULE__, :param, accumulate: true)
  @param :foo
  @param :bar
  @param 8252



  # A function may be call to define/assign a value to a constant, a module  attribute
  # It's called at compilation time and its return value substituted in for the attribute.
   @my_address URI.parse("https://example.com")


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
    num* @mydub # here, we read the constant inside the function double
  end

  def myfunc do
    IO.puts("Accessing #{@my_address.authority} on port #{@my_address.port} ")
    IO.puts("An accumulated attribute @param: #{ inspect @param}")
  end

end
