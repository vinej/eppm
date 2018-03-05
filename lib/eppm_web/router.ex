defmodule EppmWeb.Router do
  use EppmWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug EppmWeb.Plugs.SetUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EppmWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/project", ProjectController
    resources "/user", UserController
    resources "/plan", PlanController
    resources "/company", CompanyController
  end

  
  scope "/auth", EppmWeb do
    pipe_through :browser

    get "/signout", AuthController, :signout
    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
  end

  # Other scopes may use custom stacks.
  # scope "/api", EppmWeb do
  #   pipe_through :api
  # end
end
