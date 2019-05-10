# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :howl,
  ecto_repos: [Howl.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :howl, HowlWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0nu4rxxAwW3Vy+B6Lbiony8t5QdreJyts4l6ybkZiaUoxRc/OxNKNJE37omb14ee",
  render_errors: [view: HowlWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Howl.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
