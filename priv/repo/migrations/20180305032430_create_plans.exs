defmodule Eppm.Repo.Migrations.CreatePlans do
  use Ecto.Migration

  def change do
    create table(:plan) do
      add :name, :string
      add :code, :string
      add :project_id, references(:project)

      timestamps()
    end

  end
end
