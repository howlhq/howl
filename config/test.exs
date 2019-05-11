use Mix.Config

# Configure your database
config :howl, Howl.Repo,
  username: {:system, "DATABASE_USER", "howl"},
  password: {:system, "DATABASE_PASSWORD", "howl"},
  database: {:system, "DATABASE_NAME", "howl_test"},
  hostname: {:system, "DATABASE_HOST", "postgres"},
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :howl, HowlWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
