# A basic script on how to reuse code/functionality

# This is through aliases, require, import, use(a macro)
# # Alias the module so it can be called as Bar instead of Foo.Bar
# alias Foo.Bar, as: Bar

# # Import functions from Foo so they can be called without the `Foo.` prefix
# import Foo

# # Require the module in order to use its macros
# require Foo

# Invokes the custom code defined in Foo as an extension point
# use Foo

# require & use are typically used with macros

# alias Elixir.Math, as: Math
# IO.puts(Math.square(2))

# import Elixir.Math, only: [double: 1]
# IO.puts(double(3))
# IO.puts(square(2)) # raises undefined function since it's not imported

# import Elixir.Math, except: [square: 1]
# IO.puts(double(3))
# IO.puts(square(2)) # raises undefined function since it's not imported
# IO.puts(modulo(4,3))
