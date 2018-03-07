defmodule Eppm.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset


  schema "post" do
    field :title, :string 
    belongs_to :user, Eppm.Users.User 
    has_many :comments, Eppm.Comments.Comment 
    
    timestamps()
  end

  @doc false
  def changeset(struct, params \\ %{}) do 
    struct 
    |> cast(params, [:title]) 
    |> validate_required([:title]) 
  end 
end
