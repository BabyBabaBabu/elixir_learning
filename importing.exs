# A  basic script showcasing how to use import in Elixir

# import Elixir.Math, only: [double: 1]
# IO.puts(double(3))
# IO.puts(square(2)) # raises undefined function since it's not imported

import Elixir.Math, except: [square: 1]
IO.puts(double(3))
# IO.puts(square(2)) # raises undefined function since it's not imported
IO.puts(modulo(4,3))
