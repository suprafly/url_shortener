defmodule UrlShortenerWeb.PageController do
  use UrlShortenerWeb, :controller

  alias UrlShortener.Urls
  alias UrlShortener.Urls.Url

  def home(conn, _params) do
    render(conn, :home, layout: false, url: nil, changeset: Url.base_changeset())
  end

  def submit(conn, %{"url" => params}) do
    case Urls.create_url(params) do
      {:ok, new_url} ->
        conn
        |> put_flash(:success, "Url successfully shortened!")
        |> render(:home, layout: false, url: new_url, changeset: Url.base_changeset())
      {:error, _error} ->
        conn
        |> put_flash(:error, "Url has already been shortened")
        |> render(:home, layout: false, url: nil, changeset: Url.base_changeset())
    end
  end

  def forward(conn, %{"slug" => slug}) do
    url = Urls.get_by_slug!(slug)
    redirect(conn, external: url.url)
  end
end

