defmodule WorkshopWeb.BoardController do
  use WorkshopWeb, :controller

  alias Workshop.Board

  def create(conn, %{"name" => name}) do
    case Board.create(name) do
      {:ok, board} ->
        conn
        |> put_status(:created)
        |> render("board_with_lists.json", board: board)

      {:error, _changeset} ->
        conn
        |> put_status(:bad_request)
        |> json(%{errors: ["Invalid Board"]})
    end  
  end

  def index(conn, _params) do
    boards = Board.list_boards() 
    render(conn, "boards.json", boards: boards)
  end

  def show(conn, %{"id" => id}) do
    board = Board.get_board!(id)
    render(conn, "board_with_lists.json", board: board)
  end
end