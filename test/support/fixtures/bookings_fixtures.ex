defmodule Scheduler.BookingsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Scheduler.Bookings` context.
  """

  @doc """
  Generate a booking.
  """
  def booking_fixture(attrs \\ %{}) do
    {:ok, booking} =
      attrs
      |> Enum.into(%{
        date: ~D[2025-08-23],
        time: ~T[14:00:00]
      })
      |> Scheduler.Bookings.create_booking()

    booking
  end
end
