defmodule Eppm.Plans.Plan do
  use Ecto.Schema
  import Ecto.Changeset


  schema "plan" do
    field :code, :string
    field :name, :string

    belongs_to :project, Eppm.Projects.Project

    timestamps()
  end

  @doc false
  def changeset(plan, attrs) do
    plan
    |> cast(attrs, [:name, :code])
    |> validate_required([:name, :code])
  end
end
