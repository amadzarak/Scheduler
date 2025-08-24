defmodule Scheduler.Patient do
  use Ecto.Schema
  import Ecto.Changeset

  schema "patients" do
    field :first_name, :string
    field :middle_name, :string
    field :last_name, :string
    field :email, :string
    field :phone, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(patient, attrs) do
    patient
    |> cast(attrs, [:first_name, :middle_name, :last_name, :email, :phone])
    |> validate_required([:first_name, :middle_name, :last_name, :email, :phone])
  end
end
