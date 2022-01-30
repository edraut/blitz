import Config

config :blitz, :riot,
  key: System.get_env("RIOT_KEY"),
  key_type: System.get_env("RIOT_KEY_TYPE")

config :blitz, :terminal_input,
  handler: Blitz.TerminalHandler
