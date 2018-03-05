defmodule Eppm.Repo.Migrations.AddProjectPlanCie do
  use Ecto.Migration

  def change do
    alter table(:project) do
      add :company_id, references(:company)
    end
  end
end
