defmodule Myapp.SocialFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Myapp.Social` context.
  """

  @doc """
  Generate a comment.
  """
  def comment_fixture(attrs \\ %{}) do
    {:ok, comment} =
      attrs
      |> Enum.into(%{
        body: "some body",
        commenentable_id: 42,
        commentable_type: "some commentable_type"
      })
      |> Myapp.Social.create_comment()

    comment
  end
end
