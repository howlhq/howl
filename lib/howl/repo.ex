defmodule Howl.Repo do
  use Ecto.Repo,
    otp_app: :howl,
    adapter: Ecto.Adapters.Postgres
end
