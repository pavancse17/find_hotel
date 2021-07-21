defmodule FindHotelWeb.GeolocationController do
  use FindHotelWeb, :controller
  alias FindHotel.{GeolocationService, GeolocationService.Geolocation}

  def detail(conn, %{"ip_address" => ip_address}) do
    case GeolocationService.get_geolocation_by(ip_address: ip_address) do
      %Geolocation{} = geolocation ->
        json(conn, geolocation)

      nil ->
        json(conn, %{
          message: "Geolocation with ip address #{ip_address} not present in our records."
        })
    end
  end
end
