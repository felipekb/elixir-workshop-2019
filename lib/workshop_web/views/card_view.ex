defmodule  WorkshopWeb.CardView do
  use WorkshopWeb, :view

  def render("card.json", %{card: card}) do 
    %{
      id: card.id,
      text: card.text
    }  
  end
end 
