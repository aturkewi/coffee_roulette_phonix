defmodule CoffeeRoulettePhx.DepartmentController do
  use CoffeeRoulettePhx.Web, :controller
  alias CoffeeRoulettePhx.Department

  def create(conn, %{"department" => department_params}) do
    changeset = Department.changeset(%Department{}, department_params)

    case Repo.insert(changeset) do
      {:ok, department} ->
        conn
        |> put_flash(:info, "#{department.name} added!")
        |> redirect(to: company_path(conn, :show, department.company_id))
      {:error, changeset} ->
        conn
          |> put_flash(:erro, "Could not create department")
          |> redirect(to: company_path(conn, :show, department_params["company_id"]))
    end
  end
end
