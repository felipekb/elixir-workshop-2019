defmodule Workshop.Repo.Migrations.CreateBoardListsTable do
  use Ecto.Migration

  def change do
    create table(:board_lists) do
      add :title, :string, null: false
      add :board_id, references(:boards), null: false

      timestamps()
    end
  end
end
