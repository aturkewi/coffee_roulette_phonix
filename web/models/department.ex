defmodule CoffeeRoulettePhx.Department do
  use CoffeeRoulettePhx.Web, :model

  schema "departments" do
    field :name, :string

    belongs_to :company, CoffeeRoulettePhx.Company
    has_many :employees, CoffeeRoulettePhx.Employee

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :company_id])
    |> validate_required([:name, :company_id])
  end
end
