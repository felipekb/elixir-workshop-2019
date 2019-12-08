defmodule  WorkshopWeb.BoardView do
  use WorkshopWeb, :view

  def render("board_with_lists.json", %{board: board}) do 
    %{
      id: board.id,
      name: board.name,
      lists: render_many(board.board_lists, WorkshopWeb.BoardListView, "list_with_lists.json" )
    }  
  end
  
  def render("boards.json", %{boards: boards}) do
    render_many(boards, __MODULE__, "board.json")
  end

  def render("board.json", %{board: board}) do
    %{
      id: board.id,
      name: board.name
    }
  end
end 
