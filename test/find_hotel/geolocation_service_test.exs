defmodule FindHotel.GeolocationServiceTest do
  use FindHotel.DataCase

  alias FindHotel.GeolocationService

  describe "geolocations" do
    alias FindHotel.GeolocationService.Geolocation

    @valid_attrs %{
      city: "Bangalore",
      country: "India",
      country_code: "IN",
      ip_address: "123.122.101.111",
      latitude: "99.4343",
      longitude: "101.323",
      mystery_value: "654546456"
    }
    @update_attrs %{
      city: "Berlin",
      country: "Germany",
      country_code: "DE",
      ip_address: "123.111.101.112",
      latitude: "55.054",
      longitude: "99.88",
      mystery_value: "543543545"
    }
    @invalid_attrs %{
      city: nil,
      country: nil,
      country_code: nil,
      ip_address: nil,
      latitude: nil,
      longitude: nil,
      mystery_value: nil
    }

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
      assert {:ok, %Geolocation{} = geolocation} =
               GeolocationService.create_geolocation(@valid_attrs)

      assert geolocation.city == "Bangalore"
      assert geolocation.country == "India"
      assert geolocation.country_code == "IN"
      assert geolocation.ip_address == "123.122.101.111"
      assert geolocation.latitude == "99.4343"
      assert geolocation.longitude == "101.323"
      assert geolocation.mystery_value == "654546456"
    end

    test "create_geolocation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GeolocationService.create_geolocation(@invalid_attrs)
    end

    test "update_geolocation/2 with valid data updates the geolocation" do
      geolocation = geolocation_fixture()

      assert {:ok, %Geolocation{} = geolocation} =
               GeolocationService.update_geolocation(geolocation, @update_attrs)

      assert geolocation.city == "Berlin"
      assert geolocation.country == "Germany"
      assert geolocation.country_code == "DE"
      assert geolocation.ip_address == "123.111.101.112"
      assert geolocation.latitude == "55.054"
      assert geolocation.longitude == "99.88"
      assert geolocation.mystery_value == "543543545"
    end

    test "update_geolocation/2 with invalid data returns error changeset" do
      geolocation = geolocation_fixture()

      assert {:error, %Ecto.Changeset{}} =
               GeolocationService.update_geolocation(geolocation, @invalid_attrs)

      assert geolocation == GeolocationService.get_geolocation!(geolocation.id)
    end

    test "delete_geolocation/1 deletes the geolocation" do
      geolocation = geolocation_fixture()
      assert {:ok, %Geolocation{}} = GeolocationService.delete_geolocation(geolocation)

      assert_raise Ecto.NoResultsError, fn ->
        GeolocationService.get_geolocation!(geolocation.id)
      end
    end

    test "change_geolocation/1 returns a geolocation changeset" do
      geolocation = geolocation_fixture()
      assert %Ecto.Changeset{} = GeolocationService.change_geolocation(geolocation)
    end
  end
end
