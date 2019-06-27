defmodule BlognewWeb.PageController do
  use BlognewWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
