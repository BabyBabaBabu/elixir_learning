# A basic script to highlight how to work with input/output, filesystem tasks & modulees: IO,Files & Path

# IO
name = IO.gets("Name: ")
IO.puts("Hello #{name}")

# File operations
{:ok, file} = File.open("C:/Users/alex/Documents/Projects/Elixir Projects/Basics/helloworld.txt", [:write])
IO.binwrite(file, "\tHello World from Elixir\n")
File.close(file)
File.read("C:/Users/alex/Documents/Projects/Elixir Projects/Basics/helloworld.txt")
File.read!("C:/Users/alex/Documents/Projects/Elixir Projects/Basics/helloworld.txt")

# In a case clause
case IO.gets("Name: ") do
  data -> IO.puts("Hello #{data}")
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

server = spawn(fn -> receive do msg -> IO.puts(inspect(msg)) end end)
IO.write(server, "Hello World")  # since server has terminated one cannot send to it, ErlangError
