defmodule Myapp.SocialTest do
  use Myapp.DataCase

  alias Myapp.Social

  describe "comments" do
    alias Myapp.Social.Comment

    import Myapp.SocialFixtures

    @invalid_attrs %{body: nil, commenentable_id: nil, commentable_type: nil}

    test "list_comments/0 returns all comments" do
      comment = comment_fixture()
      assert Social.list_comments() == [comment]
    end

    test "get_comment!/1 returns the comment with given id" do
      comment = comment_fixture()
      assert Social.get_comment!(comment.id) == comment
    end

    test "create_comment/1 with valid data creates a comment" do
      valid_attrs = %{body: "some body", commenentable_id: 42, commentable_type: "some commentable_type"}

      assert {:ok, %Comment{} = comment} = Social.create_comment(valid_attrs)
      assert comment.body == "some body"
      assert comment.commenentable_id == 42
      assert comment.commentable_type == "some commentable_type"
    end

    test "create_comment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Social.create_comment(@invalid_attrs)
    end

    test "update_comment/2 with valid data updates the comment" do
      comment = comment_fixture()
      update_attrs = %{body: "some updated body", commenentable_id: 43, commentable_type: "some updated commentable_type"}

      assert {:ok, %Comment{} = comment} = Social.update_comment(comment, update_attrs)
      assert comment.body == "some updated body"
      assert comment.commenentable_id == 43
      assert comment.commentable_type == "some updated commentable_type"
    end

    test "update_comment/2 with invalid data returns error changeset" do
      comment = comment_fixture()
      assert {:error, %Ecto.Changeset{}} = Social.update_comment(comment, @invalid_attrs)
      assert comment == Social.get_comment!(comment.id)
    end

    test "delete_comment/1 deletes the comment" do
      comment = comment_fixture()
      assert {:ok, %Comment{}} = Social.delete_comment(comment)
      assert_raise Ecto.NoResultsError, fn -> Social.get_comment!(comment.id) end
    end

    test "change_comment/1 returns a comment changeset" do
      comment = comment_fixture()
      assert %Ecto.Changeset{} = Social.change_comment(comment)
    end
  end
end
