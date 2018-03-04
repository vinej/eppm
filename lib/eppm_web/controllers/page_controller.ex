defmodule EppmWeb.PageController do
  use EppmWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
