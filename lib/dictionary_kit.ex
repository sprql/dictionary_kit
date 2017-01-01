defmodule DictionaryKit do
  @moduledoc """
  Documentation for DictionaryKit.
  """

  def tokenize(text) do
    text
    |> String.replace(~r/\W/, " ")
    |> String.replace(~r/\d+/, "")
    |> String.replace(~r/\s+/, " ")
    |> String.split()
  end

  def string_to_map(string) do
    string
    |> String.split
    |> Enum.into(%{}, &{&1, true})
  end

  def filter_by_dict(list, dict) do
    Enum.reduce(list, [], fn(word, list) ->
      case known_word?(word, dict) do
        false -> list
        word -> [word | list]
      end
    end)
  end

  def known_word?(word, dict) do
    downcase = String.downcase(word)
    singular = String.replace(String.downcase(word), ~r/s\Z/, "\\1")
    cond do
      Map.has_key?(dict, word) -> word
      Map.has_key?(dict, downcase) -> downcase
      Map.has_key?(dict, singular) -> singular
      true -> false
    end
  end
end
