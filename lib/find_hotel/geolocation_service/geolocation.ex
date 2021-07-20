defmodule FindHotel.GeolocationService.Geolocation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "geolocations" do
    field :city, :string
    field :country, :string
    field :country_code, :string
    field :ip_address, :string
    field :latitude, :string
    field :longitude, :string
    field :mystery_value, :string

    timestamps()
  end

  @doc false
  def changeset(geolocation, attrs) do
    geolocation
    |> cast(attrs, [:ip_address, :country_code, :country, :city, :latitude, :longitude, :mystery_value])
    |> validate_required([:ip_address, :country_code, :country, :city, :latitude, :longitude, :mystery_value])
  end
end
