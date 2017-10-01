defmodule CoffeeRoulettePhx.UserController do
  use CoffeeRoulettePhx.Web, :controller

  def show(conn, %{"id" => id}) do
    user = Repo.get(CoffeeRoulettePhx.User, id)
    render conn, "show.html", user: user
  end
end
