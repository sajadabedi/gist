defmodule Gist.Snippets.Snippet do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "snippets" do
    field :name, :string
    field :description, :string
    field :markup_text, :string
    belongs_to :user, Gist.Accounts.User
    has_many :comment, Gist.Comments.Comment

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(snippet, attrs) do
    snippet
    |> cast(attrs, [:name, :description, :markup_text, :user_id])
    |> validate_required([:name, :description, :markup_text, :user_id])
  end
end
