defmodule Appbox.Migrations do
  def copy do
    File.rm(Path.join(app_priv_folder(), "repo/migrations/*.exs"))

    for file <- files() do
      target = Path.basename(file)
      target = Path.join(priv_migrations_folder(), target)
      IO.puts("Appbox.Migrations.copy: #{file} -> #{target}")
      File.copy(file, target)
    end
  end

  def files do
    Path.wildcard("#{app_folder()}/lib/**/**/migrations/*.exs")
  end

  def priv_migrations_folder do
    Path.join(app_priv_folder(), "repo/migrations")
  end

  def app_priv_folder do
    Appbox.Config.priv_folder()
  end

  def app_folder do
    Appbox.Config.appfolder()
  end
end
