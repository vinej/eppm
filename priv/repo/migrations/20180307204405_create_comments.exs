defmodule Eppm.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comment) do
      add :content, :string 
      add :user_id, references(:user) 
      add :post_id, references(:post) 
      
      timestamps()
    end

  end
end
