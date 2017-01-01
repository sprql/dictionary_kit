# DictionaryKit

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `dictionary_kit` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:dictionary_kit, "~> 0.1.0"}]
end
```


## Usage

```elixir
# Tokenize source text
list = File.read!("source.txt") |> DictionaryKit.tokenize 
# => ["Some", "words", ...]

# Create dictionary of existing words
existing_words_dict = File.read!("/usr/share/dict/words") |> DictionaryKit.string_to_map()
# => %{"the" => true, "word" => true, ...}

# Filter and normalize list by dictionary, exclude short words, remove duplicates
min_word_length = 2
list = list |> DictionaryKit.filter_by_dict(system_dict) |> Enum.uniq |> Enum.filter(&(String.length(&1) > min_word_length))
# => ["some", "word", ...]

# Create dictionary of known words
known_words_dict = File.read!("known_words.txt") |> DictionaryKit.string_to_map()
# => %{"a" => true, "the" => true, ...}

# Get known words from source list
known_words = list |> DictionaryKit.filter_by_dict(known_words_dict)
# => ["some", "word"]

# Exlude known words from source list
list -- known_words
# => ["glamour"]
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/dictionary_kit](https://hexdocs.pm/dictionary_kit).

