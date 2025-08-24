defmodule SchedulerWeb.PageController do
  use SchedulerWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
