use Mix.Config

config :logger, level: :info

config :howl, HowlWeb.Endpoint,
  http: [port: {:system, :integer, "PORT", 4000}],
  url: [host: {:system, "HOST", "localhost"}, port: {:system, :integer, "PORT", 4000}],
  cache_static_manifest: "priv/static/cache_manifest.json",
  server: true,
  root: ".",
  version: Application.spec(:howl, :vsn)

config :howl, Howl.Repo,
  username: "howl",
  password: "howl",
  database: "howl_dev",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "20")

config :howl, HowlWeb.Endpoint,
  http: [:inet6, port: String.to_integer(System.get_env("PORT") || "4000")],
  secret_key_base: System.get_env("SECRET_KEY_BASE") || ""
