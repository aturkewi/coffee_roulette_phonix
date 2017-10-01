defmodule CoffeeRoulettePhx.UserController do
  use CoffeeRoulettePhx.Web, :controller
  alias CoffeeRoulettePhx.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, "new.html", changeset: changeset
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(CoffeeRoulettePhx.User, id)
    render conn, "show.html", user: user
  end
end
