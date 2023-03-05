defmodule Myapp.Social.SocialRouter do
  defmacro __using__(_) do
    quote do
      alias MyappWeb.CommentLive
      live "/comments", CommentLive.Index, :index
      live "/comments/new", CommentLive.Index, :new
      live "/comments/:id/edit", CommentLive.Index, :edit
      live "/comments/:id", CommentLive.Show, :show
      live "/comments/:id/show/edit", CommentLive.Show, :edit
    end
  end
end
