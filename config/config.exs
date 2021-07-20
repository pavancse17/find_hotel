# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :find_hotel,
  ecto_repos: [FindHotel.Repo]

# Configures the endpoint
config :find_hotel, FindHotelWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MqdP2K8DIcygaGF0p6r4On6sNzTY9kGbia/VfUsZkFyWA4OOwoMQqGUE8L3jeNyh",
  render_errors: [view: FindHotelWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: FindHotel.PubSub,
  live_view: [signing_salt: "e86Qb7WX"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
