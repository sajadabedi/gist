defmodule Gist.Snippets.SavedSnippet do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "saved_snippets" do
    belongs_to :user, Gist.Accounts.User
    belongs_to :snippet, Gist.Snippets.Snippet

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(saved_snippet, attrs) do
    saved_snippet
    |> cast(attrs, [:user_id, :snippet_id])
    |> validate_required([:user_id, :snippet_id])
  end
end
