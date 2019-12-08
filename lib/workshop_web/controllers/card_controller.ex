defmodule WorkshopWeb.CardController do
  use WorkshopWeb, :controller

  alias Workshop.Card

  def create(conn, %{"text" => text, "board_list_id" => board_list_id}) do
    case Card.create(text, board_list_id) do
      {:ok, card} ->
        conn
        |> put_status(:created)
        |> render("card.json", card: card)

      {:error, _changeset} ->
        conn
        |> put_status(:bad_request)
        |> json(%{errors: ["Invalid Card"]})
    end  
  end
end