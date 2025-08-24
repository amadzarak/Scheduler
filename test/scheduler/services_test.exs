defmodule Scheduler.ServicesTest do
  use Scheduler.DataCase

  alias Scheduler.Services

  describe "services" do
    alias Scheduler.Services.Service

    import Scheduler.ServicesFixtures

    @invalid_attrs %{active: nil, description: nil, service_name: nil, price: nil}

    test "list_services/0 returns all services" do
      service = service_fixture()
      assert Services.list_services() == [service]
    end

    test "get_service!/1 returns the service with given id" do
      service = service_fixture()
      assert Services.get_service!(service.id) == service
    end

    test "create_service/1 with valid data creates a service" do
      valid_attrs = %{active: true, description: "some description", service_name: "some service_name", price: "120.5"}

      assert {:ok, %Service{} = service} = Services.create_service(valid_attrs)
      assert service.active == true
      assert service.description == "some description"
      assert service.service_name == "some service_name"
      assert service.price == Decimal.new("120.5")
    end

    test "create_service/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Services.create_service(@invalid_attrs)
    end

    test "update_service/2 with valid data updates the service" do
      service = service_fixture()
      update_attrs = %{active: false, description: "some updated description", service_name: "some updated service_name", price: "456.7"}

      assert {:ok, %Service{} = service} = Services.update_service(service, update_attrs)
      assert service.active == false
      assert service.description == "some updated description"
      assert service.service_name == "some updated service_name"
      assert service.price == Decimal.new("456.7")
    end

    test "update_service/2 with invalid data returns error changeset" do
      service = service_fixture()
      assert {:error, %Ecto.Changeset{}} = Services.update_service(service, @invalid_attrs)
      assert service == Services.get_service!(service.id)
    end

    test "delete_service/1 deletes the service" do
      service = service_fixture()
      assert {:ok, %Service{}} = Services.delete_service(service)
      assert_raise Ecto.NoResultsError, fn -> Services.get_service!(service.id) end
    end

    test "change_service/1 returns a service changeset" do
      service = service_fixture()
      assert %Ecto.Changeset{} = Services.change_service(service)
    end
  end
end
