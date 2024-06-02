defmodule Wailee.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      WaileeWeb.Telemetry,
      {Phoenix.PubSub, name: Wailee.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Wailee.Finch},
      # Start a worker by calling: Wailee.Worker.start_link(arg)
      # {Wailee.Worker, arg},
      # Start to serve requests, typically the last entry
      WaileeWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Wailee.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    WaileeWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
