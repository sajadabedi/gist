defmodule Gist.SnippetsTest do
  use Gist.DataCase

  alias Gist.Snippets

  describe "snippets" do
    alias Gist.Snippets.Snippet

    import Gist.SnippetsFixtures

    @invalid_attrs %{name: nil, description: nil, markup_text: nil}

    test "list_snippets/0 returns all snippets" do
      snippet = snippet_fixture()
      assert Snippets.list_snippets() == [snippet]
    end

    test "get_snippet!/1 returns the snippet with given id" do
      snippet = snippet_fixture()
      assert Snippets.get_snippet!(snippet.id) == snippet
    end

    test "create_snippet/1 with valid data creates a snippet" do
      valid_attrs = %{name: "some name", description: "some description", markup_text: "some markup_text"}

      assert {:ok, %Snippet{} = snippet} = Snippets.create_snippet(valid_attrs)
      assert snippet.name == "some name"
      assert snippet.description == "some description"
      assert snippet.markup_text == "some markup_text"
    end

    test "create_snippet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Snippets.create_snippet(@invalid_attrs)
    end

    test "update_snippet/2 with valid data updates the snippet" do
      snippet = snippet_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", markup_text: "some updated markup_text"}

      assert {:ok, %Snippet{} = snippet} = Snippets.update_snippet(snippet, update_attrs)
      assert snippet.name == "some updated name"
      assert snippet.description == "some updated description"
      assert snippet.markup_text == "some updated markup_text"
    end

    test "update_snippet/2 with invalid data returns error changeset" do
      snippet = snippet_fixture()
      assert {:error, %Ecto.Changeset{}} = Snippets.update_snippet(snippet, @invalid_attrs)
      assert snippet == Snippets.get_snippet!(snippet.id)
    end

    test "delete_snippet/1 deletes the snippet" do
      snippet = snippet_fixture()
      assert {:ok, %Snippet{}} = Snippets.delete_snippet(snippet)
      assert_raise Ecto.NoResultsError, fn -> Snippets.get_snippet!(snippet.id) end
    end

    test "change_snippet/1 returns a snippet changeset" do
      snippet = snippet_fixture()
      assert %Ecto.Changeset{} = Snippets.change_snippet(snippet)
    end
  end

  describe "saved_snippets" do
    alias Gist.Snippets.SavedSnippet

    import Gist.SnippetsFixtures

    @invalid_attrs %{}

    test "list_saved_snippets/0 returns all saved_snippets" do
      saved_snippet = saved_snippet_fixture()
      assert Snippets.list_saved_snippets() == [saved_snippet]
    end

    test "get_saved_snippet!/1 returns the saved_snippet with given id" do
      saved_snippet = saved_snippet_fixture()
      assert Snippets.get_saved_snippet!(saved_snippet.id) == saved_snippet
    end

    test "create_saved_snippet/1 with valid data creates a saved_snippet" do
      valid_attrs = %{}

      assert {:ok, %SavedSnippet{} = saved_snippet} = Snippets.create_saved_snippet(valid_attrs)
    end

    test "create_saved_snippet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Snippets.create_saved_snippet(@invalid_attrs)
    end

    test "update_saved_snippet/2 with valid data updates the saved_snippet" do
      saved_snippet = saved_snippet_fixture()
      update_attrs = %{}

      assert {:ok, %SavedSnippet{} = saved_snippet} = Snippets.update_saved_snippet(saved_snippet, update_attrs)
    end

    test "update_saved_snippet/2 with invalid data returns error changeset" do
      saved_snippet = saved_snippet_fixture()
      assert {:error, %Ecto.Changeset{}} = Snippets.update_saved_snippet(saved_snippet, @invalid_attrs)
      assert saved_snippet == Snippets.get_saved_snippet!(saved_snippet.id)
    end

    test "delete_saved_snippet/1 deletes the saved_snippet" do
      saved_snippet = saved_snippet_fixture()
      assert {:ok, %SavedSnippet{}} = Snippets.delete_saved_snippet(saved_snippet)
      assert_raise Ecto.NoResultsError, fn -> Snippets.get_saved_snippet!(saved_snippet.id) end
    end

    test "change_saved_snippet/1 returns a saved_snippet changeset" do
      saved_snippet = saved_snippet_fixture()
      assert %Ecto.Changeset{} = Snippets.change_saved_snippet(saved_snippet)
    end
  end
end
