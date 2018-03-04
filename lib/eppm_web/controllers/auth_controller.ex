defmodule EppmWeb.AuthController do
  use EppmWeb, :controller
  plug Ueberauth

  alias Eppm.Repo
  alias Eppm.Accounts.User

  def callback(conn, _params) do
    %{assigns: %{ueberauth_auth: auth}} = conn

    user_params = %{name: "jyv:", token: auth.credentials.token, email: auth.info.email, provider: "github"}
    changeset = User.changeset(%User{}, user_params)

    signin(conn, changeset)
  end

  def signout(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: page_path(conn, :index))
  end

  defp signin(conn, changeset) do
    case insert_or_update_user(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> put_session(:user_id, user.id)
        |> redirect(to: page_path(conn, :index))
      {:error, _reason} ->
        conn
        |> put_flash(:error, "Error signing in")
        |> redirect(to: page_path(conn, :index))
    end
  end

  defp insert_or_update_user(changeset) do
    IO.inspect changeset
    case Repo.get_by(User, email: changeset.changes.email) do
      nil ->
        Repo.insert(changeset)
      user ->
        {:ok, user}
    end
  end
end