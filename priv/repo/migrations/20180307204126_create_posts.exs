defmodule Eppm.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:post) do
      add :title, :string 
      add :user_id, references(:user) 
            
      timestamps()
    end

  end
end
