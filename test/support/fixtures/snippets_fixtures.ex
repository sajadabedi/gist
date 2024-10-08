defmodule Gist.SnippetsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Gist.Snippets` context.
  """

  @doc """
  Generate a snippet.
  """
  def snippet_fixture(attrs \\ %{}) do
    {:ok, snippet} =
      attrs
      |> Enum.into(%{
        description: "some description",
        markup_text: "some markup_text",
        name: "some name"
      })
      |> Gist.Snippets.create_snippet()

    snippet
  end

  @doc """
  Generate a saved_snippet.
  """
  def saved_snippet_fixture(attrs \\ %{}) do
    {:ok, saved_snippet} =
      attrs
      |> Enum.into(%{

      })
      |> Gist.Snippets.create_saved_snippet()

    saved_snippet
  end
end
