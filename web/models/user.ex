defmodule CoffeeRoulettePhx.User do
  use CoffeeRoulettePhx.Web, :model

  @accetable_params ~w(first_name last_name email username password)

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @accetable_params, [])
    |> validate_length(:username, min: 6, max: 20)
  end
end
