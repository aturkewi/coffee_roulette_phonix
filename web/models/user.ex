defmodule CoffeeRoulettePhx.User do
  use CoffeeRoulettePhx.Web, :model

  @accetable_params ~w(first_name last_name email username)

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    has_many :companies, CoffeeRoulettePhx.Company

    timestamps()
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @accetable_params, [])
    |> validate_length(:username, min: 6, max: 20)
  end

  def registration_changeset(model, params) do
    model
    |> changeset(params)
    |> cast(params, ~w(password), [])
    |> validate_length(:password, min: 6, max: 100)
    |> unique_constraint(:email, message: "There is already an account with this email. ")
    |> unique_constraint(:username, message: "There is already an account with this username. ")
    |> put_pass_hash()
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
  end
end
