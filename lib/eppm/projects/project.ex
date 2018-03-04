defmodule Eppm.Projects.Project do
  use Ecto.Schema
  import Ecto.Changeset


  schema "project" do
    field :code, :string
    field :desc, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name, :code, :desc])
    |> validate_required([:name, :code, :desc])
  end
end
