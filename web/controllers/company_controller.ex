defmodule CoffeeRoulettePhx.CompanyController do
  use CoffeeRoulettePhx.Web, :controller
  plug :authenticate when action in [:show]
  alias CoffeeRoulettePhx.Company

  def new(conn, _params) do
    changeset = Company.changeset(%Company{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"company" => company_params}) do
    changeset = Company.changeset(%Company{}, company_params)
    case Repo.insert(changeset) do
      {:ok, company} ->
        conn
        |> put_flash(:info, "#{company.name} created!")
        |> redirect(to: company_path(conn, :show, company))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    company = Company
      |> Repo.get(id)

    render conn, "show.html", company: company
  end

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
