defmodule CoffeeRoulettePhx.PageController do
  use CoffeeRoulettePhx.Web, :controller

  def index(conn, _params) do
    current_user = conn.assigns[:current_user]
    if current_user do
      redirect conn, to: user_path(conn, :show, current_user.id)
    else
      render conn, "index.html"
    end
  end
end
