defmodule CoffeeRoulettePhx.Repo.Migrations.AddCompanyTable do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :name, :string

      timestamps()
    end

    alter table(:users) do
      add :company_id, :integer
    end
  end
end
