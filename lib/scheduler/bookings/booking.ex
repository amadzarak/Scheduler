defmodule Scheduler.Bookings.Booking do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bookings" do
    field :date, :date
    field :time, :time

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(booking, attrs) do
    booking
    |> cast(attrs, [:date, :time])
    |> validate_required([:date, :time])
  end
end
