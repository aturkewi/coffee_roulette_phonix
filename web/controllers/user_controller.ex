defmodule CoffeeRoulettePhx.UserController do
  use CoffeeRoulettePhx.Web, :controller
  alias CoffeeRoulettePhx.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)
    {:ok, user} = Repo.insert(changeset)

    conn
    |> put_flash(:info, "#{user.first_name} created!")
    |> redirect(to: user_path(conn, :show, user))
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(CoffeeRoulettePhx.User, id)
    render conn, "show.html", user: user
  end
end
