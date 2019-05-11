defmodule Howl.Repo do
  use Ecto.Repo,
    otp_app: :howl,
    adapter: Ecto.Adapters.Postgres

  def init(_, config) do
    config = Confex.Resolver.resolve!(config)

    unless config[:database] do
      raise "Database connection not configured!"
    end

    {:ok, config}
  end
end
