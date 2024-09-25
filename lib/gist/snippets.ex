defmodule Gist.Snippets do
  @moduledoc """
  The Snippets context.
  """

  import Ecto.Query, warn: false
  alias Gist.Repo

  alias Gist.Snippets.Snippet

  @doc """
  Returns the list of snippets.

  ## Examples

      iex> list_snippets()
      [%Snippet{}, ...]

  """
  def list_snippets do
    Repo.all(Snippet)
  end

  @doc """
  Gets a single snippet.

  Raises `Ecto.NoResultsError` if the Snippet does not exist.

  ## Examples

      iex> get_snippet!(123)
      %Snippet{}

      iex> get_snippet!(456)
      ** (Ecto.NoResultsError)

  """
  def get_snippet!(id), do: Repo.get!(Snippet, id)

  @doc """
  Creates a snippet.

  ## Examples

      iex> create_snippet(%{field: value})
      {:ok, %Snippet{}}

      iex> create_snippet(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_snippet(user, attrs \\ %{}) do
    user
    |> Ecto.build_assoc(:snippets)
    |> Snippet.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a snippet.

  ## Examples

      iex> update_snippet(snippet, %{field: new_value})
      {:ok, %Snippet{}}

      iex> update_snippet(snippet, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_snippet(%Snippet{} = snippet, attrs) do
    snippet
    |> Snippet.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a snippet.

  ## Examples

      iex> delete_snippet(snippet)
      {:ok, %Snippet{}}

      iex> delete_snippet(snippet)
      {:error, %Ecto.Changeset{}}

  """
  def delete_snippet(%Snippet{} = snippet) do
    Repo.delete(snippet)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking snippet changes.

  ## Examples

      iex> change_snippet(snippet)
      %Ecto.Changeset{data: %Snippet{}}

  """
  def change_snippet(%Snippet{} = snippet, attrs \\ %{}) do
    Snippet.changeset(snippet, attrs)
  end

  alias Gist.Snippets.SavedSnippet

  @doc """
  Returns the list of saved_snippets.

  ## Examples

      iex> list_saved_snippets()
      [%SavedSnippet{}, ...]

  """
  def list_saved_snippets do
    Repo.all(SavedSnippet)
  end

  @doc """
  Gets a single saved_snippet.

  Raises `Ecto.NoResultsError` if the Saved snippet does not exist.

  ## Examples

      iex> get_saved_snippet!(123)
      %SavedSnippet{}

      iex> get_saved_snippet!(456)
      ** (Ecto.NoResultsError)

  """
  def get_saved_snippet!(id), do: Repo.get!(SavedSnippet, id)

  @doc """
  Creates a saved_snippet.

  ## Examples

      iex> create_saved_snippet(%{field: value})
      {:ok, %SavedSnippet{}}

      iex> create_saved_snippet(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_saved_snippet(user, attrs \\ %{}) do
    user
    |> Ecto.build_assoc(:saved_snippets)
    |> SavedSnippet.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a saved_snippet.

  ## Examples

      iex> update_saved_snippet(saved_snippet, %{field: new_value})
      {:ok, %SavedSnippet{}}

      iex> update_saved_snippet(saved_snippet, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_saved_snippet(%SavedSnippet{} = saved_snippet, attrs) do
    saved_snippet
    |> SavedSnippet.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a saved_snippet.

  ## Examples

      iex> delete_saved_snippet(saved_snippet)
      {:ok, %SavedSnippet{}}

      iex> delete_saved_snippet(saved_snippet)
      {:error, %Ecto.Changeset{}}

  """
  def delete_saved_snippet(%SavedSnippet{} = saved_snippet) do
    Repo.delete(saved_snippet)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking saved_snippet changes.

  ## Examples

      iex> change_saved_snippet(saved_snippet)
      %Ecto.Changeset{data: %SavedSnippet{}}

  """
  def change_saved_snippet(%SavedSnippet{} = saved_snippet, attrs \\ %{}) do
    SavedSnippet.changeset(saved_snippet, attrs)
  end
end
