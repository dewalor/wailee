defmodule WaileeWeb.PageController do
  use WaileeWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def who(conn, _params) do
    # The who page is custom made,
    # so skip the default app layout.
    render(conn, :who, layout: false)
  end

  def art(conn, _params) do
    # The who page is custom made,
    # so skip the default app layout.
    render(conn, :art, layout: false)
  end

  def events(conn, _params) do
    # The who page is custom made,
    # so skip the default app layout.
    render(conn, :events, layout: false)
  end
end
