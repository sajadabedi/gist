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
end
