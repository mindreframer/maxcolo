defmodule Myapp.Page.PageRouter do
  defmacro __using__(_) do
    quote do
      get "/", MyappWeb.PageController, :home
    end
  end
end
