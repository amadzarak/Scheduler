defmodule Scheduler.Repo.Migrations.CreateServices do
  use Ecto.Migration

  def change do
    create table(:services) do
      add :service_name, :string
      add :description, :string
      add :active, :boolean, default: false, null: false
      add :price, :decimal

      timestamps(type: :utc_datetime)
    end
  end
end
