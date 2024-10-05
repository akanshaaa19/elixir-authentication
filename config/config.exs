# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :apiElixir,
  ecto_repos: [ApiElixir.Repo],
  generators: [timestamp_type: :utc_datetime, binary_id: true]

# Configures the endpoint
config :apiElixir, ApiElixirWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: ApiElixirWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: ApiElixir.PubSub,
  live_view: [signing_salt: "uK/do8Qt"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :apiElixir, ApiElixirWeb.Auth.Guardian,
    issuer: "api_elixir",
    secret_key: "05n46R3i46i9Z1txAEQys91ZL5vNabjx93YXTP1lFC2PthJSpY3javmyTm85Kot9"

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
