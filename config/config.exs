# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :eppm,
  ecto_repos: [Eppm.Repo]

# Configures the endpoint
config :eppm, EppmWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PjcFUiGafGJ7M6wLBEyeItFgkPWcq/MKObJMrVWjyFkfwQU51g/XnQq+szJ1ymXv",
  render_errors: [view: EppmWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Eppm.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"


config :ueberauth, Ueberauth,
  providers: [
    github: { Ueberauth.Strategy.Github, [] }
  ]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: "45f8bf2c36bede1c9c08",
  client_secret: "38f6f674e183e02eec0dd22b6203aefeabdbc584"

config :arc,
  storage: Arc.Storage.Local,
  storage_dir: "upload"
