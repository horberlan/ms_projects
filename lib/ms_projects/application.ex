defmodule MsProjects.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      MsProjectsWeb.Telemetry,
      MsProjects.Repo,
      {DNSCluster, query: Application.get_env(:ms_projects, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: MsProjects.PubSub},
      # Start a worker by calling: MsProjects.Worker.start_link(arg)
      # {MsProjects.Worker, arg},
      # Start to serve requests, typically the last entry
      MsProjectsWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MsProjects.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MsProjectsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
