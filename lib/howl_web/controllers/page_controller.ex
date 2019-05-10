defmodule HowlWeb.PageController do
  use HowlWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
