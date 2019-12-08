defmodule WorkshopWeb.Router do
  use WorkshopWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end 

  scope "/api", WorkshopWeb do
    pipe_through :api

    resources "/boards", BoardController, only: [:create, :index, :show]

    post "/lists/:board_list_id/cards", CardController, :create
  end
  # Other scopes may use custom stacks.
  # scope "/api", WorkshopWeb do
  #   pipe_through :api
  # end
end
