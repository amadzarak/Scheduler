defmodule Scheduler.ServicesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Scheduler.Services` context.
  """

  @doc """
  Generate a service.
  """
  def service_fixture(attrs \\ %{}) do
    {:ok, service} =
      attrs
      |> Enum.into(%{
        active: true,
        description: "some description",
        price: "120.5",
        service_name: "some service_name"
      })
      |> Scheduler.Services.create_service()

    service
  end
end
