defmodule Eppm.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset


  schema "comment" do
    field :content, :string 
    belongs_to :user, Eppm.Accounts.User 
    belongs_to :post, Eppm.Posts.Post 

    timestamps()
  end

  @doc false
  def changeset(comment, params \\ %{}) do 
    comment 
    |> cast(params, [:content]) 
  end  
end
