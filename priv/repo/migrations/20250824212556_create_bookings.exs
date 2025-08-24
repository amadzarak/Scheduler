defmodule Scheduler.Repo.Migrations.CreateBookings do
  use Ecto.Migration

  def change do
    create table(:bookings) do
      add :date, :date
      add :time, :time

      timestamps(type: :utc_datetime)
    end
  end
end
