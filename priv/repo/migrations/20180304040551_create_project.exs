defmodule Eppm.Repo.Migrations.CreateProject do
  use Ecto.Migration

  def change do
    create table(:project) do
      add :name, :string
      add :code, :string
      add :desc, :string

      timestamps()
    end

  end
end
