defmodule FindHotel.Repo do
  use Ecto.Repo,
    otp_app: :find_hotel,
    adapter: Ecto.Adapters.Postgres
end
