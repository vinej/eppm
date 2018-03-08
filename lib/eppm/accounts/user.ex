defmodule Eppm.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  use Arc.Ecto.Schema

  @derive {Poison.Encoder, only: [:email, :name, :provider, :id, :token, :avatar]}

  schema "user" do
    field :email, :string
    field :name, :string
    field :token, :string
    field :provider, :string
    field :avatar, Eppm.Avatars.Avatar.Type

    timestamps()
  end

  @doc false
  def changeset(user, attrs \\ :empty) do
    user
    |> cast(attrs, [:email, :name, :provider, :token])
    |> cast_attachments(attrs, [:avatar])
    |> validate_required([:email, :name])
  end
end
