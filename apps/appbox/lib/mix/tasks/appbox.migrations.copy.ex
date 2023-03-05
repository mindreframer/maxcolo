defmodule Mix.Tasks.Appbox.Migrations.Copy do
  use Mix.Task

  @shortdoc "Copy all migrations to a single folder"

  @moduledoc """
  Copy all migrations to a single folder
  ## Examples

      $ mix appbox.migrations.copy
  """

  @impl true
  def run(_args) do
    IO.puts("Appbox.Migrations.copy...")
    Appbox.Migrations.copy()
  end
end
