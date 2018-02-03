defmodule CoffeeRoulettePhx.Employee do
  use CoffeeRoulettePhx.Web, :model

  schema "employees" do
    field :company_id, :integer
    field :email, :string
    field :name, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:company_id, :email, :name])
    |> validate_required([:company_id, :email, :name])
  end
end
