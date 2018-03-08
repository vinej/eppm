defmodule Eppm.Repo.Migrations.AddImageBinary do
  use Ecto.Migration

  def change do 
    alter table(:user) do 
      add :avatar, :string
    end 
  end
end
