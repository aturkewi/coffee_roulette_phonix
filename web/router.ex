defmodule CoffeeRoulettePhx.Router do
  use CoffeeRoulettePhx.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug CoffeeRoulettePhx.Auth, repo: CoffeeRoulettePhx.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CoffeeRoulettePhx do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/users", UserController, only: [:new, :create, :show]
    resources "/companies", CompanyController, only: [:new, :create, :show]
    resources "/employees", EmployeeController, only: [:create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", CoffeeRoulettePhx do
  #   pipe_through :api
  # end
end
