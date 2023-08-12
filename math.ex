defmodule Math do
  @moduledoc """
  Some basic Math functions

  ## Examples
      iex> Math.modulo(4, 3)
          1

      iex> Math.square(2)
          4

  """

  @doc """
  Calculates the square of a number
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

  def double(num) do
    num*2
  end

end
