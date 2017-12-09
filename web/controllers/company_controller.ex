defmodule CoffeeRoulettePhx.CompanyController do
  use CoffeeRoulettePhx.Web, :controller
  plug :authenticate when action in [:show]
  alias CoffeeRoulettePhx.Company

  def new(conn, _params) do
    changeset = Company.changeset(%Company{})
    render conn, "new.html", changeset: changeset
  end

  # def create(conn, %{"user" => user_params}) do
  #   changeset = User.registration_changeset(%User{}, user_params)
  #   case Repo.insert(changeset) do
  #     {:ok, user} ->
  #       conn
  #       |> CoffeeRoulettePhx.Auth.login(user)
  #       |> put_flash(:info, "#{user.first_name} created!")
  #       |> redirect(to: user_path(conn, :show, user))
  #     {:error, changeset} ->
  #       render(conn, "new.html", changeset: changeset)
  #   end
  # end

  # def show(conn, %{"id" => id}) do
  #   user = User
  #     |> preload([:companies])
  #     |> Repo.get(id)
  #
  #   render conn, "show.html", user: user
  # end

  defp authenticate(conn, _opts) do
    if conn.assigns.current_user do
      conn
    else
      conn
      |> put_flash(:error, "You must be logged in to access that page")
      |> redirect(to: page_path(conn, :index))
      |> halt()
    end
  end
end
