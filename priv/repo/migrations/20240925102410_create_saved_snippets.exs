defmodule Gist.Repo.Migrations.CreateSavedSnippets do
  use Ecto.Migration

  def change do
    create table(:saved_snippets, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :user_id, references(:users, on_delete: :delete_all, type: :binary_id)
      add :snippet_id, references(:snippets, on_delete: :delete_all, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:saved_snippets, [:user_id])
    create index(:saved_snippets, [:snippet_id])
  end
end
