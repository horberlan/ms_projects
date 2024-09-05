defmodule MsProjects.Repo do
  use Ecto.Repo,
    otp_app: :ms_projects,
    adapter: Ecto.Adapters.Postgres
end
