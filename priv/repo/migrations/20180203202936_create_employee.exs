defmodule CoffeeRoulettePhx.Repo.Migrations.CreateEmployee do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add :department_id, :integer
      add :email, :string
      add :name, :string

      timestamps()
    end

  end
end
