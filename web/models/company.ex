defmodule CoffeeRoulettePhx.User do
  use CoffeeRoulettePhx.Web, :model

  @accetable_params ~w(name)

  schema "companies" do
    field :name, :string

    timestamps()
  end

end
