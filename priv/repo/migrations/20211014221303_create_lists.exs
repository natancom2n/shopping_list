defmodule ShoppingList.Repo.Migrations.CreateLists do
  use Ecto.Migration

  def change do
    create table(:lists) do
      add :product, :string
      add :price, :float
      add :completed, :boolean, default: false, null: false

      timestamps()
    end
  end
end
