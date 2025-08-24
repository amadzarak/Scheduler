defmodule Scheduler.Repo.Migrations.CreatePatients do
  use Ecto.Migration

  def change do
    create table(:patients) do
      add :first_name, :string
      add :middle_name, :string
      add :last_name, :string
      add :email, :string
      add :phone, :string

      timestamps(type: :utc_datetime)
    end
  end
end
