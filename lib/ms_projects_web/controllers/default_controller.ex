defmodule MsProjectsWeb.DefaultController do
  use MsProjectsWeb, :controller

  def index(conn, _params) do
    text conn, "MsProjectsWeb is live - #{Mix.env()}"
  end
end
