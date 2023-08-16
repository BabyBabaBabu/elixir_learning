# A basic script on how to work with sigils  in Elixir
# sigils are a mechanism to work with textual representations
# They start with the tilde (~) character which is followed by a letter which identifies the sigil, then a delimiter
# One can add a modifier at the end of the delimiter
# Delimiters: /, (), [], <>, {}, "", '', |

# ~r for regular expressions, regex
# Regex is based on PCRE (Perl Compatible Regular Expressions) and built on top of Erlang's :re module.
# Regular expressions created via sigils are pre-compiled and stored in the .beam file.

regex = ~r/foo|bar/
IO.puts("food" =~ regex) # returns true
IO.puts("bad" =~ regex) # returns false

IO.puts("HELLO" =~ ~r/hello/) # returns false since it's case sensitive
# add modifier "i" to make it case insensitive, e.g
IO.puts("HELLO" =~ ~r/hello/i) # now returns true


# ~s  strings, esp when strings contain double quotes
~s(this is a string with "double" quotes, not 'single' ones) |> IO.puts() # preserves the double quotes around a string

# ~s allows for interpolation of strings & character escaping
~s(String with escape codes \x26 #{"inter" <> "polation"}) |> IO.puts()

# ~c charlist
~c(this is a char list containing "double quotes") |> IO.puts()

# ~w generates a list of words that are regular string
~w(Don't worry be happy) |> inspect() |> IO.puts()

# use modifiers to specify data type of elements in the list e.g a - atom, c - charlist, s - string
~w(Don't worry be happy)c |> inspect() |> IO.puts()
~w(who am i)a |> inspect |> IO.puts()

# Use ~S to escape characters when writing docs
# @doc ~S"""
# Converts double-quotes to single-quotes.

# ## Examples
#
#    iex> convert("\"foo\"")
#    "'foo'"
#
# """

# Working with Date & Time

# %Date struct contains the fields, year, month, day & calender
d = ~D[2023-08-16]
IO.puts(d.day) # returns 16
IO.puts(d.month) # returns 8

#  %Time{} struct contains the fields hour, minute, second, microsecond & calendar
t = ~T[16:39:30.0]
IO.puts(t.minute)
IO.puts(t.second)

# %NaiveDateTime{} struct contains fields from both Date and Time
ndt = ~N[2019-10-31 23:00:07]
IO.puts(ndt.year)
IO.puts(ndt.second)

#  %DateTime{} contains fields from both Date and Time with the addition of fields to track timezones.
dt = ~U[2019-10-31 19:59:03Z]
IO.puts(dt.time_zone)
IO.puts(dt.minute)
IO.puts(dt.month)
IO.puts(dt.calendar)
