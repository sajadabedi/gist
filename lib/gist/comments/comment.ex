defmodule Gist.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "comments" do
    field :markup_text, :string
    belongs_to :user, Gist.Accounts.User
    belongs_to :snippet, Gist.Snippets.Snippet

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:markup_text, :user_id, :snippet_id])
    |> validate_required([:markup_text, :user_id, :snippet_id])
  end
end
