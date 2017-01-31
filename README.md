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

source_data = File.read!("source.txt")
# => "Brave New World..."

known_words = File.read!("known_words.txt")
# => "world brave..."

dictionary = File.read!("/usr/share/dict/words")
# => "a apple..."

DictionaryKit.find_unknown_words(source_data, known_words, dictionary)
# => ["new"]
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/dictionary_kit](https://hexdocs.pm/dictionary_kit).

