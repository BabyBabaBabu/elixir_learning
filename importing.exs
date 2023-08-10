# A  basic script showcasing how to use import in Elixir
# import is used, to access functions or macros from other modules without using the fully-qualified name.

# to import specific functions use :only and specify the arity
# import Elixir.Math, only: [double: 1]
# IO.puts(double(3))
# IO.puts(square(2)) # raises undefined function since it's not imported

# to exclude specific functions use :except and specify the arity
import Elixir.Math, except: [square: 1]
IO.puts(double(3))
# IO.puts(square(2)) # raises undefined function since it's not imported
IO.puts(modulo(4,3))
