defmodule FindHotel.GeolocationServiceTest do
  use FindHotel.DataCase

  alias FindHotel.GeolocationService

  describe "geolocations" do
    alias FindHotel.GeolocationService.Geolocation

    @valid_attrs %{city: "some city", country: "some country", country_code: "some country_code", ip_address: "some ip_address", latitude: "some latitude", longitude: "some longitude", mystery_value: "some mystery_value"}
    @update_attrs %{city: "some updated city", country: "some updated country", country_code: "some updated country_code", ip_address: "some updated ip_address", latitude: "some updated latitude", longitude: "some updated longitude", mystery_value: "some updated mystery_value"}
    @invalid_attrs %{city: nil, country: nil, country_code: nil, ip_address: nil, latitude: nil, longitude: nil, mystery_value: nil}

    def geolocation_fixture(attrs \\ %{}) do
      {:ok, geolocation} =
        attrs
        |> Enum.into(@valid_attrs)
        |> GeolocationService.create_geolocation()

      geolocation
    end

    test "list_geolocations/0 returns all geolocations" do
      geolocation = geolocation_fixture()
      assert GeolocationService.list_geolocations() == [geolocation]
    end

    test "get_geolocation!/1 returns the geolocation with given id" do
      geolocation = geolocation_fixture()
      assert GeolocationService.get_geolocation!(geolocation.id) == geolocation
    end

    test "create_geolocation/1 with valid data creates a geolocation" do
      assert {:ok, %Geolocation{} = geolocation} = GeolocationService.create_geolocation(@valid_attrs)
      assert geolocation.city == "some city"
      assert geolocation.country == "some country"
      assert geolocation.country_code == "some country_code"
      assert geolocation.ip_address == "some ip_address"
      assert geolocation.latitude == "some latitude"
      assert geolocation.longitude == "some longitude"
      assert geolocation.mystery_value == "some mystery_value"
    end

    test "create_geolocation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GeolocationService.create_geolocation(@invalid_attrs)
    end

    test "update_geolocation/2 with valid data updates the geolocation" do
      geolocation = geolocation_fixture()
      assert {:ok, %Geolocation{} = geolocation} = GeolocationService.update_geolocation(geolocation, @update_attrs)
      assert geolocation.city == "some updated city"
      assert geolocation.country == "some updated country"
      assert geolocation.country_code == "some updated country_code"
      assert geolocation.ip_address == "some updated ip_address"
      assert geolocation.latitude == "some updated latitude"
      assert geolocation.longitude == "some updated longitude"
      assert geolocation.mystery_value == "some updated mystery_value"
    end

    test "update_geolocation/2 with invalid data returns error changeset" do
      geolocation = geolocation_fixture()
      assert {:error, %Ecto.Changeset{}} = GeolocationService.update_geolocation(geolocation, @invalid_attrs)
      assert geolocation == GeolocationService.get_geolocation!(geolocation.id)
    end

    test "delete_geolocation/1 deletes the geolocation" do
      geolocation = geolocation_fixture()
      assert {:ok, %Geolocation{}} = GeolocationService.delete_geolocation(geolocation)
      assert_raise Ecto.NoResultsError, fn -> GeolocationService.get_geolocation!(geolocation.id) end
    end

    test "change_geolocation/1 returns a geolocation changeset" do
      geolocation = geolocation_fixture()
      assert %Ecto.Changeset{} = GeolocationService.change_geolocation(geolocation)
    end
  end
end
