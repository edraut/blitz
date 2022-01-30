defmodule Blitz.ServerTest do
  use ExUnit.Case, async: true
  import Mox
  import Blitz.RiotFixtures
  import ExUnit.CaptureIO

  setup do
    Tesla.MockAdapter
    |> expect(:call, 3, fn %Tesla.Env{method: :get, url: request_url}, _opts -> riot_fixture(request_url) end)
    %{}
  end

  test "responds with a list of participants from last 5 matches", %{} do
    Blitz.MockTerminalHandler
    |> expect(:get_summoner_and_region, fn -> %{summoner_name: "asdf", region: "americas"} end)

    {{params, participants}, output} = with_io(fn -> Blitz.Server.respond() end)

    assert output == "[Freyskol, Asdf, Hoo Lee Phuc]\n"
    assert params == %{region: "americas", summoner_name: "asdf"}
    assert participants == participants()
  end

  test "shows new matches", %{} do
    last_tick = DateTime.add(DateTime.utc_now(), -60, :second)
    state = %{last_tick: last_tick, minute_count: 59, participants: participants(), params: %{region: "americas"}}
    {{this_tick, this_minute_count}, result} = with_io(fn -> Blitz.Server.show_new_matches(state) end)
    assert result == "Summoner Hoo Lee Phuc completed match NA1_4199334988\n"
    assert this_tick == DateTime.add(last_tick, 60, :second)
    assert this_minute_count == 60
  end

  defp participants() do
    [
      %{
        puuid: "hZcp9W_2_rnn16QpLxno0h0HD-cnS8YFXzfQHuGWuGWmfMNwVdu8GY966aYMDUR_87JW0PBf-X0zog",
        summoner_name: "Freyskol"
      },
      %{
        puuid: "c-52HREuK2bXfFnbDCKgwPKfAeV5k6ovUoUaxW4MD9ANyVJy4q2yUPH3qYcY02SQ2HcHbAE1H0Fetg",
        summoner_name: "Asdf"
      },
      %{
        puuid: "0W2J3OvUNYYhpcDPI1T1EW_ebbL1KP1v1EUqWV0wMFlI-iIgdYWqCHdyngNiHQBrC7TMF-Yq1HLvNQ",
        summoner_name: "Hoo Lee Phuc"
      }
    ]
  end
end
