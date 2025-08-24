defmodule SchedulerWeb.BookingControllerTest do
  use SchedulerWeb.ConnCase

  import Scheduler.BookingsFixtures

  @create_attrs %{date: ~D[2025-08-23], time: ~T[14:00:00]}
  @update_attrs %{date: ~D[2025-08-24], time: ~T[15:01:01]}
  @invalid_attrs %{date: nil, time: nil}

  describe "index" do
    test "lists all bookings", %{conn: conn} do
      conn = get(conn, ~p"/bookings")
      assert html_response(conn, 200) =~ "Listing Bookings"
    end
  end

  describe "new booking" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/bookings/new")
      assert html_response(conn, 200) =~ "New Booking"
    end
  end

  describe "create booking" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/bookings", booking: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/bookings/#{id}"

      conn = get(conn, ~p"/bookings/#{id}")
      assert html_response(conn, 200) =~ "Booking #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/bookings", booking: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Booking"
    end
  end

  describe "edit booking" do
    setup [:create_booking]

    test "renders form for editing chosen booking", %{conn: conn, booking: booking} do
      conn = get(conn, ~p"/bookings/#{booking}/edit")
      assert html_response(conn, 200) =~ "Edit Booking"
    end
  end

  describe "update booking" do
    setup [:create_booking]

    test "redirects when data is valid", %{conn: conn, booking: booking} do
      conn = put(conn, ~p"/bookings/#{booking}", booking: @update_attrs)
      assert redirected_to(conn) == ~p"/bookings/#{booking}"

      conn = get(conn, ~p"/bookings/#{booking}")
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, booking: booking} do
      conn = put(conn, ~p"/bookings/#{booking}", booking: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Booking"
    end
  end

  describe "delete booking" do
    setup [:create_booking]

    test "deletes chosen booking", %{conn: conn, booking: booking} do
      conn = delete(conn, ~p"/bookings/#{booking}")
      assert redirected_to(conn) == ~p"/bookings"

      assert_error_sent 404, fn ->
        get(conn, ~p"/bookings/#{booking}")
      end
    end
  end

  defp create_booking(_) do
    booking = booking_fixture()

    %{booking: booking}
  end
end
