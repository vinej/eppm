defmodule Eppm.Projects.Project do
  use Ecto.Schema
  import Ecto.Changeset


  schema "project" do
    field :code, :string
    field :desc, :string
    field :name, :string

    has_many :plan, Eppm.Plans.Plan
    belongs_to :company, Eppm.Companies.Company

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name, :code, :desc, :company_id])
    |> validate_required([:name, :code, :desc, :company_id])
  end
end
