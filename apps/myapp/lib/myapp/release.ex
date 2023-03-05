defmodule Myapp.Release do
  @app :myapp

  def migrate do
    for repo <- repos() do
      {:ok, _, _} =
        Ecto.Migrator.with_repo(repo, fn repo ->
          Ecto.Migrator.run(repo, sources(), :up, all: true)
        end)
    end
  end

  def rollback(repo, version) do
    {:ok, _, _} =
      Ecto.Migrator.with_repo(repo, fn repo -> Ecto.Migrator.run(repo, :down, to: version) end)
  end

  def sources do
    (:code.priv_dir(:myapp) |> List.to_string()) <> "/repo/migrations"
  end

  defp repos do
    Application.load(@app)
    Application.fetch_env!(@app, :ecto_repos)
  end
end
