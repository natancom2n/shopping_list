defmodule ShoppingList.Lists.List do
  use Ecto.Schema
  import Ecto.Changeset

  schema "lists" do
    field :completed, :boolean, default: false
    field :price, :float
    field :product, :string

    timestamps()
  end

  @doc false
  def changeset(list, attrs) do
    list
    |> cast(attrs, [:product, :price, :completed])
    |> validate_required([:product, :price, :completed])
  end
end
