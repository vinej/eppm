defmodule Eppm.Repo.Migrations.CreateCompanies do
  use Ecto.Migration

  def change do
    create table(:company) do
      add :name, :string
      add :code, :string

      timestamps()
    end

  end
end
