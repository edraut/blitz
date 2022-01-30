defmodule Riot.Http do
  @moduledoc """
  Documentation for `Riot.HTTP`.
  This module is responsible for managing HTTP requests to the Riot API.
  It manages headers, url and path structure.
  It handles request lifecycle, e.g. API errors, network errors
  It transforms the Riot response bodies to Elixir maps and hands them back to the caller
  """

  def get_summoner_by_name(name, region, key) do
    name = URI.encode(name)
    do_get_request("https://#{region}.api.riotgames.com/lol/summoner/v4/summoners/by-name/#{name}?api_key=#{key}")
  end

  def get_matches_by_puuid(%{puuid: puuid, region: region, start_time: start_time}, key) do
    do_get_request("https://#{region}.api.riotgames.com/lol/match/v5/matches/by-puuid/#{puuid}/ids?api_key=#{key}&startTime=#{start_time}")
  end

  def get_matches_by_puuid(%{puuid: puuid, region: region, count: count}, key) do
    do_get_request("https://#{region}.api.riotgames.com/lol/match/v5/matches/by-puuid/#{puuid}/ids?api_key=#{key}&count=#{count}")
  end

  def get_match(match_id, region, key) do
    do_get_request("https://#{region}.api.riotgames.com/lol/match/v5/matches/#{match_id}?api_key=#{key}")
  end

  defp do_get_request(request_url) do
    # TODO handle Tesla errors as they arise with purpose-built cases here
    case Tesla.get(request_url) do
      {:ok, response} -> handle_riot_response(response)
      tesla_err -> tesla_err
    end
  end

  defp handle_riot_response(response) do
    body = Jason.decode!(response.body)
    case response.status do
      200 -> body
      _ -> handle_riot_error(body)
    end
  end

  defp handle_riot_error(body) do
    IO.puts body, label: "handle_riot_error"
    case body["status"]["status_code"] do
      403 -> {:riot_error, "Forbidden, check your RIOT_KEY env var and restart the app."}
      # TODO as new cases are encountered, handle them with specific logic here
      err ->
        IO.inspect err
        exit(:normal)
    end
  end
end
