use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :find_hotel, FindHotel.Repo,
  username: System.get_env("DB_USER_NAME"),
  password: System.get_env("DB_USER_PASSWORD"),
  database: "find_hotel_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: System.get_env("DB_HOST"),
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :find_hotel, FindHotelWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
