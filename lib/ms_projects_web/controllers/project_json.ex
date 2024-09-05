defmodule MsProjectsWeb.ProjectJSON do
  alias MsProjects.Projects.Project

  @doc """
  Renders a list of projects.
  """
  def index(%{projects: projects}) do
    %{data: Enum.map(projects, &data/1)}
  end

  @doc """
  Renders a single project.
  """
  def show(%{project: project}) do
    %{data: data(project)}
  end

  defp data(%Project{} = project) do
    %{
      id: project.id,
      name: project.name,
      type: project.type
    }
  end
end
