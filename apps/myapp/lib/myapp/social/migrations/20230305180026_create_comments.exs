defmodule Myapp.Ecto.Migration.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :commenentable_id, :integer
      add :commentable_type, :string
      add :body, :text

      timestamps()
    end
  end
end
