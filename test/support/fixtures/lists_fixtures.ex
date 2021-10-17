defmodule ShoppingList.ListsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ShoppingList.Lists` context.
  """

  @doc """
  Generate a list.
  """
  def list_fixture(attrs \\ %{}) do
    {:ok, list} =
      attrs
      |> Enum.into(%{
        completed: true,
        price: 120.5,
        product: "some product"
      })
      |> ShoppingList.Lists.create_list()

    list
  end
end
