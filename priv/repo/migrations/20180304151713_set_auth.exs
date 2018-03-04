defmodule Eppm.Repo.Migrations.SetAuth do
  use Ecto.Migration

  def change do
    alter table(:user) do
      add :token, :string
      add :provider, :string
    end
  end
end
