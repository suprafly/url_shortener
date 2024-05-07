defmodule UrlShortener.Repo.Migrations.CreateUrls do
  use Ecto.Migration

  def change do
    create table(:urls) do
      add :url, :string
      add :slug, :string

      timestamps()
    end

    create unique_index(:urls, [:url])
  end
end
