defmodule Eppm.Companies.Company do
  use Ecto.Schema
  import Ecto.Changeset

  schema "company" do
    field :code, :string
    field :name, :string

    has_many :project, Eppm.Projects.Project
    timestamps()
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:name, :code])
    |> validate_required([:name, :code])
  end
end
