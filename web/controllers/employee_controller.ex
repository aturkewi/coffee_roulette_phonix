defmodule CoffeeRoulettePhx.EmployeeController do
  use CoffeeRoulettePhx.Web, :controller
  alias CoffeeRoulettePhx.Employee

  def create(conn, %{"employee" => employee_params}) do
    changeset = Employee.changeset(%Employee{}, employee_params)

    case Repo.insert(changeset) do
      {:ok, company} ->
        conn
        |> put_flash(:info, "#{company.name} created!")
        |> redirect(to: company_path(conn, :show, company))
      {:error, changeset} ->
        conn
          |> put_flash(:erro, "Could not add user")
          |> redirect(to: company_path(conn, :show, employee_params["company_id"]))
    end
  end
end
