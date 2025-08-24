defmodule Scheduler.Services.Service do
  use Ecto.Schema
  import Ecto.Changeset

  schema "services" do
    field :service_name, :string
    field :description, :string
    field :active, :boolean, default: false
    field :price, :decimal

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(service, attrs) do
    service
    |> cast(attrs, [:service_name, :description, :active, :price])
    |> validate_required([:service_name, :description, :active, :price])
  end
end
