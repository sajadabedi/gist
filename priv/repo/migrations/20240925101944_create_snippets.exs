defmodule Gist.Repo.Migrations.CreateSnippets do
  use Ecto.Migration

  def change do
    create table(:snippets, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :description, :text
      add :markup_text, :text
      add :user_id, references(:users, on_delete: :delete_all, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:snippets, [:user_id])
  end
end
