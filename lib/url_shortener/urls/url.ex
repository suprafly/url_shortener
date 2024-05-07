defmodule UrlShortener.Urls.Url do
  use Ecto.Schema
  import Ecto.Changeset

  schema "urls" do
    field :slug, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def base_changeset() do
    cast(%__MODULE__{}, %{}, [:url])
  end

  @doc false
  def changeset(url \\ %__MODULE__{}, attrs) do
    url
    |> cast(attrs, [:url, :slug])
    |> validate_required([:url, :slug])
    |> unique_constraint(:url)
  end
end
