defmodule BlognewWeb.Router do
  use BlognewWeb, :router
  use Pow.Phoenix.Router


  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: Pow.Phoenix.PlugErrorHandler
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do # signup routes
    pipe_through :browser
    pow_routes()
  end

  scope "/", BlognewWeb do
    pipe_through [:browser, :protected]
    resources "/posts", PostController
  end

  scope "/", BlognewWeb do
    pipe_through :browser
    # get "/", PageController, :index making /posts as default url
    get "/", PostController, :index
  end




  # Other scopes may use custom stacks.
  # scope "/api", BlognewWeb do
  #   pipe_through :api
  # end
end
