# A basic script to highlight how to work with input/output, filesystem tasks & modulees: IO,Files & Path

# IO
name = IO.gets("Name: ")
IO.puts("Hello #{name}")

# File operations
{:ok, file} = File.open("C:/Users/alex/Documents/Projects/Elixir Projects/Basics/helloworld.txt", [:write])
IO.binwrite(file, "\tHello World from Elixir\n")
File.close(file)
File.read("C:/Users/alex/Documents/Projects/Elixir Projects/Basics/helloworld.txt")
# File.read!("C:/Users/alex/Documents/Projects/Elixir Projects/Basics/helloworld.txt")

# In a case clause
case IO.gets("Name: ") do
  data -> IO.puts("Howdy #{data}")
  {:error, reason} -> IO.puts(reason)
end

case File.read("C:/Users/alex/Documents/Projects/Elixir Projects/Basics/helloworld.txt") do
  {:ok, body} -> IO.puts(to_string(body))
  {:error, reason} when reason == :enoent -> IO.puts("the file does not exist")
end

# Use Path for cross platform support when it comes to filepaths
case File.read(Path.expand("helloworlds.txt")) do
  {:ok, body} -> IO.puts(to_string(body))
  {:error, reason} when reason == :enoent -> IO.puts("the file does not exist")
end

# server = spawn(fn -> receive do msg -> IO.puts(inspect(msg)) end end)
# IO.write(server, "Hello World")  # since server has terminated one cannot send to it, ErlangError

#iodata & chardata
# both are lists of binaries & integers
# iodata, the integers represent bytes.
# chardata, the integers represent Unicode codepoints.

# Depending on encoding

# If the file is opened without encoding, the file is expected to be in raw mode,
# and the functions in the IO module starting with bin* must be used.
# Those functions expect an iodata as an argument, where integers in the list would represent bytes.

# the default IO device (:stdio)
# and files opened with :utf8 encoding work with the remaining functions in the IO module.
# Those functions expect a chardata as an argument
# therefore charlist a list of integers, is a special chardata, exclusively uses a list of integers Unicode codepoints

name = "Alex"
IO.puts(["Hello ",name])

Enum.join(["alex", "kitaa", "kyalo"], ",")
