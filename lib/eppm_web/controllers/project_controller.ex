defmodule EppmWeb.ProjectController do
  use EppmWeb, :controller

  alias Eppm.Projects
  alias Eppm.Projects.Project
  alias Eppm.Companies

  plug EppmWeb.Plugs.RequireAuth when action in [:new, :create, :edit, :update, :delete]

  def index(conn, _params) do
    projects = Projects.list_project()
    render(conn, "index.html", projects: projects)
  end

  def new(conn, _params) do
    changeset = Projects.change_project(%Project{})
    companies = Companies.list_companies()
    render(conn, "new.html", changeset: changeset, companies: companies)
  end

  def create(conn, %{"project" => project_params}) do
    case Projects.create_project(project_params) do
      {:ok, project} ->
        conn
        |> put_flash(:info, "Project created successfully.")
        |> redirect(to: project_path(conn, :show, project))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    project = Projects.get_project!(id)
    render(conn, "show.html", project: project)
  end

  def edit(conn, %{"id" => id}) do
    project = Projects.get_project!(id)
    changeset = Projects.change_project(project)
    companies = Companies.list_companies()
    render(conn, "edit.html", project: project, changeset: changeset, companies: companies)
  end

  def update(conn, %{"id" => id, "project" => project_params}) do
    project = Projects.get_project!(id)

    case Projects.update_project(project, project_params) do
      {:ok, project} ->
        conn
        |> put_flash(:info, "Project updated successfully.")
        |> redirect(to: project_path(conn, :show, project))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", project: project, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    project = Projects.get_project!(id)
    {:ok, _project} = Projects.delete_project(project)

    conn
    |> put_flash(:info, "Project deleted successfully.")
    |> redirect(to: project_path(conn, :index))
  end
end
