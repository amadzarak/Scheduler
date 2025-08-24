defmodule SchedulerWeb.BookingHTML do
  use SchedulerWeb, :html

  embed_templates "booking_html/*"

  @doc """
  Renders a booking form.

  The form is defined in the template at
  booking_html/booking_form.html.heex
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true
  attr :return_to, :string, default: nil

  def booking_form(assigns)
end
