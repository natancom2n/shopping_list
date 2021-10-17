# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :shopping_list,
  ecto_repos: [ShoppingList.Repo]

# Configures the endpoint
config :shopping_list, ShoppingListWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: ShoppingListWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ShoppingList.PubSub,
  live_view: [signing_salt: "k7ngtDjn"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :shopping_list, ShoppingList.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.12.18",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2016 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :shopping_list, :pow,
  user: ShoppingList.Users.User,
  repo: ShoppingList.Repo,
  web_module: ShoppingListWeb,
  extension: [PowResetPassword],
  controller_callbacks: Pow.Extension.Phoenix.ControllerCallbacks,
  mailer_backend: ShoppingList.PowMailer

  #login for github
  config :shopping_list, :pow_assent,
    providers: [
      github: [
        client_id: "b60bcf3353e396a9e418",
        cliente_secret: "0665b829a82a09fa9a2940c0a17ad7cc88dff5dd",
        strategy: Assent.Strategy.Github
      ]
    ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
