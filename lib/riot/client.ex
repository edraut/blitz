defmodule Riot.Client do
  @moduledoc """
  Documentation for `Riot.Client`.
  This module is the internal harness for accessing data from Riot
  It exposes functions that serve the purposes of this app, transforming data
  into structures needed by this app.
  It uses the underlying HTTP library to execute requests to the Riot API

  TODO: if this needs to expose many more functions to the Blitz app, it should
  be broken into more modules based on the domains and contexts of the Blitz app.
  """
  @allowed_regions ~w(americas asia europe)

  def get_recent_participants(params) do
    # TODO, learn about the relationship between platform and region, and whether
    # the project spec for region input should affect this
    Riot.Http.get_summoner_by_name(params.summoner_name, "na1", key())
    |> get_particpant_info_for_summoner(params.region)
  end

  def get_particpant_info_for_summoner(summoner, region) do
    Riot.Http.get_matches_by_puuid(%{puuid: summoner["puuid"], region: region, count: 5}, key())
    |> extract_participant_info_from_matches(region)
  end

  def extract_participant_info_from_matches(match_ids, region) do
    extract_participants(match_ids, region)
    |> extract_participant_info()
  end

  def get_match_ids_since(params) do
    Riot.Http.get_matches_by_puuid(params, key())
  end

  defp extract_participants(match_ids, region) do
    match_ids
    |> Enum.map(fn match_id ->
      # We're assuming match participant count is less than the 1 minute rate limit
      # If that proves false, we need to throttle here like we do when pulling
      # new matches
      Riot.Http.get_match(match_id, region, key())
    end)
    |> Enum.flat_map(&(&1["info"]["participants"]))
    |> Enum.uniq_by(fn %{"puuid" => puuid} -> puuid end)
  end

  defp extract_participant_info(participants) do
    # This is all the info we need in this app, saving memory by pruning unused keys
    participants
    |> Enum.map(fn participant ->
      %{puuid: participant["puuid"], summoner_name: participant["summonerName"]}
    end)
  end

  def get_match(match_id, region) do
    Riot.Http.get_match(match_id, region, key())
  end

  def valid_region?(region) do
    Enum.member?(@allowed_regions, region)
  end

  def one_minute_limit() do
    case config().key_type do
      "personal" -> 50
      "production" -> 3000
      _ -> handle_missing_riot_key_type()
    end
  end

  def interval_for_count(count) do
    case config().key_type do
      "personal" -> personal_interval_for_count(count)
      "production" -> production_interval_for_count()
      _ -> handle_missing_riot_key_type()
    end
  end

  defp personal_interval_for_count(count) do
    case count do
      value when value <= 20 -> 50 # higher throughput allowed for 20 or fewer
      _ -> 1200
    end
  end

  defp production_interval_for_count() do
    20 # No change in throughput based on period for production keys
  end

  defp handle_missing_riot_key_type() do
    IO.puts "Please set RIOT_KEY_TYPE env var to either `personal` or `production` and restart."
    System.stop(0)
  end


  defp config() do
    Enum.into(Application.get_env(:blitz, :riot), %{})
  end

  defp key() do
    config().key
  end
end
