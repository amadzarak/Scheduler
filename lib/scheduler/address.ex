defmodule Scheduler.Address do
  use Ecto.Schema
  import Ecto.Changeset

  schema "addresses" do
    field :address_line_1, :string
    field :address_line_2, :string
    field :city, :string
    field :state, :string
    field :zip, :string
    field :country, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(address, attrs) do
    address
    |> cast(attrs, [:address_line_1, :address_line_2, :city, :state, :zip, :country])
    |> validate_required([:address_line_1, :address_line_2, :city, :state, :zip, :country])
  end
end
