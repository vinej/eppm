defmodule Eppm.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset


  schema "comment" do
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
