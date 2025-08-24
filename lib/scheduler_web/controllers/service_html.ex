defmodule SchedulerWeb.ServiceHTML do
  use SchedulerWeb, :html

  embed_templates "service_html/*"

  @doc """
  Renders a service form.

  The form is defined in the template at
  service_html/service_form.html.heex
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true
  attr :return_to, :string, default: nil

  def service_form(assigns)
end
