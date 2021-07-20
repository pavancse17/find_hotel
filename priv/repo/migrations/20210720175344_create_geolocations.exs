defmodule FindHotel.Repo.Migrations.CreateGeolocations do
  use Ecto.Migration

  def change do
    create table(:geolocations) do
      add :ip_address, :string
      add :country_code, :string
      add :country, :string
      add :city, :string
      add :latitude, :string
      add :longitude, :string
      add :mystery_value, :string

      timestamps()
    end

  end
end
