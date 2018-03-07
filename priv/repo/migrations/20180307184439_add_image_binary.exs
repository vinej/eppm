defmodule Eppm.Repo.Migrations.AddImageBinary do
  use Ecto.Migration

  def change do 
    update table(:user) do 
      add :avatar, :string
    end 
  end
end
