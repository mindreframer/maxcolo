defmodule Myapp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      MyappWeb.Telemetry,
      # Start the Ecto repository
      Myapp.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Myapp.PubSub},
      # Start Finch
      {Finch, name: Myapp.Finch},
      # Start the Endpoint (http/https)
      Myapp.Endpoint
      # Start a worker by calling: Myapp.Worker.start_link(arg)
      # {Myapp.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Myapp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Myapp.Endpoint.config_change(changed, removed)
    :ok
  end
end
