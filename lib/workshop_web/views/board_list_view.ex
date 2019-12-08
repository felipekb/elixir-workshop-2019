defmodule  WorkshopWeb.BoardListView do
  use WorkshopWeb, :view

  def render("list_with_lists.json", %{board_list: board_list}) do 
    %{
      id: board_list.id,
      title: board_list.title,
      cards: render_many(board_list.cards, WorkshopWeb.CardView, "card.json")
    }  
  end
end 
