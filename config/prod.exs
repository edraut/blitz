import Config
# built-time prod config goes here

import_config "prod.secret.exs"

config :blitz, :terminal_input,
  handler: Blitz.TerminalHandler
