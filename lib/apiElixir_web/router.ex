defmodule ApiElixirWeb.Router do
  use ApiElixirWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ApiElixirWeb do
    pipe_through :api
    get "/", DefaultController, :index
  end
end
