defmodule UrlShortener do
  @moduledoc """
  UrlShortener keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def get_random_string(num_chars \\ 7) do
    num_chars = 7
    alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    random_available = alphabet <> String.downcase(alphabet) <> "0123456789" |> String.codepoints()

    1..num_chars
    |> Enum.map(fn _ -> Enum.take_random(random_available, 1) end)
    |> Enum.join()
  end
end
