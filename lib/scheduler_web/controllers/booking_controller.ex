defmodule SchedulerWeb.BookingController do
  use SchedulerWeb, :controller

  alias Scheduler.Bookings
  alias Scheduler.Bookings.Booking

  def index(conn, _params) do
    bookings = Bookings.list_bookings()
    render(conn, :index, bookings: bookings)
  end

  def new(conn, _params) do
    changeset = Bookings.change_booking(%Booking{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"booking" => booking_params}) do
    case Bookings.create_booking(booking_params) do
      {:ok, booking} ->
        conn
        |> put_flash(:info, "Booking created successfully.")
        |> redirect(to: ~p"/bookings/#{booking}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    booking = Bookings.get_booking!(id)
    render(conn, :show, booking: booking)
  end

  def edit(conn, %{"id" => id}) do
    booking = Bookings.get_booking!(id)
    changeset = Bookings.change_booking(booking)
    render(conn, :edit, booking: booking, changeset: changeset)
  end

  def update(conn, %{"id" => id, "booking" => booking_params}) do
    booking = Bookings.get_booking!(id)

    case Bookings.update_booking(booking, booking_params) do
      {:ok, booking} ->
        conn
        |> put_flash(:info, "Booking updated successfully.")
        |> redirect(to: ~p"/bookings/#{booking}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, booking: booking, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    booking = Bookings.get_booking!(id)
    {:ok, _booking} = Bookings.delete_booking(booking)

    conn
    |> put_flash(:info, "Booking deleted successfully.")
    |> redirect(to: ~p"/bookings")
  end
end
