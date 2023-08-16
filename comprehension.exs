# A basic script on how to  work with comprehensions in Elixir

# To work with Enumerables like a list, sometimes involves filtering results and maping them into a new list
# To do so, use comprehension, this utilizes the for special form
# for "generator", filter, do: collector(a function, operation)

# Example

# generate a range of integers between 1 & 10
# Filter only even integers(pattern matching)
# Return a sqaure of the even integers
for n <- 1..10, rem(n, 2) == 0, do: n*n |> inspect() |> IO.puts()

# can attempt pattern matching/filter  on the right of the <-
# the filter ignores/discards every match that evaluates to false or nil
klist1 = [good: 1, bad: 2, good: 3, good: 4, bad: 5]
for {:good, n} <- klist1, do: n * n |> inspect() |> IO.puts()

# can pass multiple filters
# here, check if greater than 5, is even
# then pattern match on the left
klist2 = [good: 3,bad: 2,good: 5,good: 8,bad: 1,bad: 7,good: 6,good: 9]
for {:good, n} <- klist2, n > 5, rem(n,2) == 0, do: n * n |> inspect() |> IO.puts()

# can pass in options, into: & uniq:
# into used to insert the results in a different data structure eg, a keywordlist into a map
mymap = %{a: 3,b: 2,c: 5,d: 8,e: 1,f: 7,g: 6,h: 9}
for {key, n} <- mymap, n > 5, rem(n,2) == 0, into: %{}, do: {key, n * n } # returns %{d: 64, g: 36}
