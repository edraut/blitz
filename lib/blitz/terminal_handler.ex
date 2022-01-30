defmodule Blitz.TerminalHandler do
  alias Riot.Client

  @behaviour Blitz.Terminal

  @impl Blitz.Terminal
  def get_summoner_and_region() do
    params = case IO.gets("enter a summoner name: ") do
      {:error, reason} ->
        IO.puts "error reading input: #{reason}, try again"
        exit(:normal)
      :eof ->
        IO.puts "end of file received, try again"
        exit(:normal)
      summoner_name -> %{summoner_name: String.trim(summoner_name)}
    end
    params = case IO.gets("enter a region: ") do
      {:error, reason} ->
        IO.puts "error reading input: #{reason}, try again"
        exit(:normal)
      :eof ->
        IO.puts "end of file received, restarting"
        exit(:normal)
      region ->
        region = String.trim(region)
        if Client.valid_region?(region) do
          Map.put(params, :region, region)
        else
          IO.puts "invalid region, please try again with one of [ americas | asia | europe ]"
          exit(:normal)
        end
    end
    params
  end
end
