defmodule Eppm.CommentsChannel do
    use EppmWeb, :channel
    alias Eppm.Posts.Post
    #alias Emmp.Comments.Comment
    #alias Emmp.Accounts.User

  
    def join("comments:" <> post_id, _params, socket) do
      #post_id = String.to_integer(post_id)
      #post =
      #  Post
      #  |> Repo.get(post_id)
      #  |> Repo.preload(:comments)
  
      #comments = render_comments(post.comments)
  
      #{:ok, %{comments: comments}, assign(socket, :post, post)}
    end
  
    def handle_in("comment:add", %{"content" => content}, socket) do
      #user = Repo.get(User, socket.assigns.user_id)
  
      #changeset =
      #  socket.assigns.post
      #  |> build_assoc(:comment)
      #  |> Comment.changeset(%{content: content})
  
      #case Repo.insert(changeset) do
      ##  {:ok, comment} ->
      #    broadcast! socket, "comments:#{socket.assigns.post.id}:new",
      #      %{comment: render_comments([comment])}
      #    {:reply, :ok, socket}
      #  {:error, _reason} ->
      #    {:reply, {:error, %{errors: changeset}}, socket}
      #end
    end
  
    defp render_comments(comments) do
      Phoenix.View.render_many(comments, Reddit.CommentView, "comments.json")
    end
  end