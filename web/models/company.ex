defmodule CoffeeRoulettePhx.Company do
  use CoffeeRoulettePhx.Web, :model

  @accetable_params ~w(name)

  schema "companies" do
    field :name, :string

    belongs_to :user, CoffeeRoulettePhx.User
    has_many :departments, CoffeeRoulettePhx.Department
    has_many :employees, through: [:departments, :employee]
    timestamps()
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @accetable_params, [])
  end

end
