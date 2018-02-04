defmodule CoffeeRoulettePhx.CompanyController do
  use CoffeeRoulettePhx.Web, :controller
  plug :authenticate when action in [:show]
  alias CoffeeRoulettePhx.Company
  alias CoffeeRoulettePhx.Employee
  alias CoffeeRoulettePhx.Department

  def new(conn, _params, user) do
    changeset =
      user
      |> build_assoc(:companies)
      |> Company.changeset()

    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"company" => company_params}, user) do
    changeset =
      user
        |> build_assoc(:companies)
        |> Company.changeset(company_params)
    case Repo.insert(changeset) do
      {:ok, company} ->
        conn
        |> put_flash(:info, "#{company.name} created!")
        |> redirect(to: company_path(conn, :show, company))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}, user) do
    company = Company
      |> preload([:departments])
      |> Repo.get(id)

    changeset =
      company
        |> build_assoc(:departments)
        |> Department.changeset()

    render conn, "show.html", company: company, changeset: changeset
  end

  def action(conn, _) do
    apply(__MODULE__, action_name(conn), [conn, conn.params, conn.assigns.current_user])
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
