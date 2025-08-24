defmodule Scheduler.Repo.Migrations.CreateAddresses do
  use Ecto.Migration

  def change do
    create table(:addresses) do
      add :address_line_1, :string
      add :address_line_2, :string
      add :city, :string
      add :state, :string
      add :zip, :string
      add :country, :string

      timestamps(type: :utc_datetime)
    end
  end
end
