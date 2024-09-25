defmodule Gist.Snippets.SavedSnippet do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "saved_snippets" do

    field :user_id, :binary_id
    field :snippet_id, :binary_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(saved_snippet, attrs) do
    saved_snippet
    |> cast(attrs, [])
    |> validate_required([])
  end
end
