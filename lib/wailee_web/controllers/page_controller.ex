defmodule WaileeWeb.PageController do
  use WaileeWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, %{})
  end

  def who(conn, _params) do
    # The who page is custom made,
    # so skip the default app layout.
    render(conn, :who,  %{})
  end

  def art(conn, _params) do
    # The who page is custom made,
    # so skip the default app layout.
    render(conn, :art,  %{})
  end

  def events(conn, _params) do
    # The who page is custom made,
    # so skip the default app layout.
    render(conn, :events,  %{})
  end
end
