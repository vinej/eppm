defmodule Eppm.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Poison.Encoder, only: [:email]}

  schema "user" do
    field :email, :string
    field :name, :string
    field :token, :string
    field :provider, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :name, :provider, :token])
    |> validate_required([:email, :name, :provider, :token])
  end
end
