defmodule ApiElixir.Repo do
  use Ecto.Repo,
    otp_app: :apiElixir,
    adapter: Ecto.Adapters.Postgres
end
