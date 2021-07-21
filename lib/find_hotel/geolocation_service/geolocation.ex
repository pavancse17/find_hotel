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
    |> cast(attrs, [
      :ip_address,
      :country_code,
      :country,
      :city,
      :latitude,
      :longitude,
      :mystery_value
    ])
    |> validate_required([
      :ip_address,
      :country_code,
      :country,
      :city,
      :latitude,
      :longitude,
      :mystery_value
    ])
    |> validate_format(:ip_address, ~r'\b((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(\.|$)){4}\b')
    |> unique_constraint(:ip_address)
    |> validate_format(:country_code, ~r'^[A-Z]{2}$')
    |> validate_format(:latitude, ~r'[\+ -]?(90(\.0+)?|[1-8]\d(\.[0-9]+)?|\d(\.0+)?)')
    |> validate_format(
      :longitude,
      ~r'[\+-]?(180(\.0+)?|1[0-7]\d(\.[0-9]+)?|[1-9]\d(\.[0-9]+)?|\d(\.[0-9]+)?)'
    )
    |> validate_format(:mystery_value, ~r'^[0-9]*$')
  end
end
