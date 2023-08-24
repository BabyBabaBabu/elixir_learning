# A basic script on how to debug Elixir programs

# To debug, We can use

# IO.inspect/2
# doesn't affect behaviour of our code, we can spy on code values without altering them/the result
# e.g in a pipeline
# we can include labels for the values to output

# 1..10
# |> IO.inspect(label: "before")
# |> Enum.map(fn x -> x * 2 end)
# |> IO.inspect(label: "after")
# |> Enum.sum
# |> IO.inspect

# # dbg/2
# # similar to IO.inspect/2 but for debugging
# # prints the value passed to it and returns it
# # also prints the code and location.
# feature = %{name: :dbg, inspiration: "Rust"}
# dbg(feature)
# dbg(Map.put(feature, :in_version, "1.14.0"))

# # when dealing with pipelines it prints additional debugging info
# # and the values at every step of the pipeline

# "Elixir is cool!"
# |> String.trim_trailing("!")
# |> String.split()
# |> List.first()
# |> dbg()
# returns "Elixir"

# dbg only supports stepping for pipelines
# in other words, it can only step through the code it sees
__ENV__.file
|> String.split("/", trim: true)
|> List.last()
|> File.exists?()
|> dbg()

# to launch your script with code calling dbg in iex run
#  iex.bat --dbg pry .\howto_debug.exs
# iex will ask you to stop code execution where dbg() call is
# This is called prying, youll access variables, imports and aliases from code
# code execution stops until the next call using n/next or continue
# dbg has limited step functionalities

# break/2
# use break/2 to set & manage breakpoints without modifying code
# this however doesn't have access to imports and aliases from your code
# it works on compiled artifact not source code
# break! Module.Function/Arity no_of_stops

# Observer
# in iex> :observer.start()

# https://www.erlang-in-anger.com/
