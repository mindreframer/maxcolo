defmodule Myapp.Social.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :body, :string
    field :commenentable_id, :integer
    field :commentable_type, :string

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:commenentable_id, :commentable_type, :body])
    |> validate_required([:commenentable_id, :commentable_type, :body])
  end
end
