defmodule Blitz.Terminal do
  @moduledoc """
  Terminal input behaviour
  """
  @callback get_summoner_and_region() :: %{summoner_name: String, region: String}
end
