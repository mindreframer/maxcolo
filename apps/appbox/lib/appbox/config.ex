defmodule Appbox.Config do
  def appfolder do
    Application.fetch_env!(:appbox, :appfolder)
  end

  def priv_folder do
    Application.fetch_env!(:appbox, :priv_folder)
  end
end
