# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :coffee_roulette_phx,
  ecto_repos: [CoffeeRoulettePhx.Repo]

# Configures the endpoint
config :coffee_roulette_phx, CoffeeRoulettePhx.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "++w2lWujT0HuwYy1v9YpKPzksGS0MuH/aNdlQw3qu35vEoVzRtcjPiCyjyKmyV8m",
  render_errors: [view: CoffeeRoulettePhx.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CoffeeRoulettePhx.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
