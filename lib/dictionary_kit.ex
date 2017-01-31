defmodule DictionaryKit do
  @moduledoc """
  Documentation for DictionaryKit.
  """

  def find_unknown_words(source, known_words, dictionary) do
    existing_words_dict = string_to_map(dictionary)
    known_words_dict = string_to_map(known_words)

    min_word_length = 2

    tokenize(source)
      |> filter_by_dict(existing_words_dict, true)
      |> Enum.uniq
      |> Enum.filter(&(String.length(&1) > min_word_length))
      |> filter_by_dict(known_words_dict, false)
  end

  defp tokenize(text) do
    text
    |> String.replace(~r/\W/, " ")
    |> String.replace(~r/\d+/, "")
    |> String.replace(~r/\s+/, " ")
    |> String.split()
  end

  defp string_to_map(string) do
    string
    |> String.split
    |> Enum.into(%{}, &{&1, true})
  end

  defp filter_by_dict(list, dict, inject \\ true) do
    reject = !inject
    Enum.reduce(list, [], fn(word, filtered) ->
      case known_word?(word, dict) do
        {^reject, _} -> filtered
        {^inject, word} -> [word | filtered]
      end
    end)
  end

  defp known_word?(word, dict) do
    downcase = String.downcase(word)
    singular = String.replace(String.downcase(word), ~r/s\Z/, "\\1")
    cond do
      Map.has_key?(dict, word) -> {true, word}
      Map.has_key?(dict, downcase) -> {true, downcase}
      Map.has_key?(dict, singular) -> {true, singular}
      true -> {false, word}
    end
  end
end
