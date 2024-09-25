defmodule Gist.Snippets.Snippet do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "snippets" do
    field :name, :string
    field :description, :string
    field :markup_text, :string
    field :user_id, :binary_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(snippet, attrs) do
    snippet
    |> cast(attrs, [:name, :description, :markup_text])
    |> validate_required([:name, :description, :markup_text])
  end
end
