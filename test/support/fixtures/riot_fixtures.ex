defmodule Blitz.RiotFixtures do
  def riot_fixture(request_url) do
    cond do
      String.contains?(request_url, "/lol/summoner/v4/summoners/by-name/asdf") ->
        {:ok,
          %Tesla.Env{
          __client__: %Tesla.Client{adapter: nil, fun: nil, post: [], pre: []},
          __module__: Tesla,
          body: "{\"id\":\"99ciO_cF_MaFo81yvXIpQtlm796sawKhDUDl52Lho_kss1w\",\"accountId\":\"o3CIz9y6v8xakB0nc5uVDIUAev72PlFPedCm4j-uebrMvyA\",\"puuid\":\"c-52HREuK2bXfFnbDCKgwPKfAeV5k6ovUoUaxW4MD9ANyVJy4q2yUPH3qYcY02SQ2HcHbAE1H0Fetg\",\"name\":\"Asdf\",\"profileIconId\":1114,\"revisionDate\":1643406484000,\"summonerLevel\":352}",
          headers: [
            {"connection", "keep-alive"},
            {"date", "Sun, 30 Jan 2022 17:01:06 GMT"},
            {"vary", "Accept-Encoding"},
            {"content-length", "291"},
            {"content-type", "application/json;charset=utf-8"},
            {"x-app-rate-limit", "20:1,100:120"},
            {"x-app-rate-limit-count", "1:1,1:120"},
            {"x-method-rate-limit", "2000:60"},
            {"x-method-rate-limit-count", "1:60"},
            {"x-riot-edge-trace-id", "7cea5ffb-39ff-447e-938f-8a894eb873a6"},
            {"access-control-allow-origin", "*"},
            {"access-control-allow-methods", "GET, PUT, DELETE, POST, OPTIONS"},
            {"access-control-allow-headers",
             "DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range"},
            {"access-control-expose-headers", "Content-Length,Content-Range"}
          ],
          method: :get,
          opts: [],
          query: [],
          status: 200,
          url: "https://na1.api.riotgames.com/lol/summoner/v4/summoners/by-name/asdf"
        }
      }
      String.contains?(request_url, "/lol/match/v5/matches/by-puuid/c-52HREuK2bXfFnbDCKgwPKfAeV5k6ovUoUaxW4MD9ANyVJy4q2yUPH3qYcY02SQ2HcHbAE1H0Fetg/ids") and String.contains?(request_url, "&count=") ->
        {:ok,
          %Tesla.Env{
          __client__: %Tesla.Client{adapter: nil, fun: nil, post: [], pre: []},
          __module__: Tesla,
          body: "[\"NA1_4196830561\"]",
          headers: [
            {"connection", "keep-alive"},
            {"date", "Sun, 30 Jan 2022 17:01:06 GMT"},
            {"vary", "Accept-Encoding"},
            {"content-length", "86"},
            {"content-type", "application/json;charset=utf-8"},
            {"x-app-rate-limit", "20:1,100:120"},
            {"x-app-rate-limit-count", "1:1,1:120"},
            {"x-method-rate-limit", "500:10"},
            {"x-method-rate-limit-count", "1:10"},
            {"x-riot-edge-trace-id", "f7c6bf27-794a-4dc1-a0de-cd2e82b304b8"},
            {"access-control-allow-origin", "*"},
            {"access-control-allow-methods", "GET, PUT, DELETE, POST, OPTIONS"},
            {"access-control-allow-headers",
             "DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range"},
            {"access-control-expose-headers", "Content-Length,Content-Range"}
          ],
          method: :get,
          opts: [],
          query: [],
          status: 200,
          url: "https://americas.api.riotgames.com/lol/match/v5/matches/by-puuid/c-52HREuK2bXfFnbDCKgwPKfAeV5k6ovUoUaxW4MD9ANyVJy4q2yUPH3qYcY02SQ2HcHbAE1H0Fetg/ids"
        }
      }
      String.contains?(request_url, "/lol/match/v5/matches/NA1_4196830561") ->
        {:ok,
          %Tesla.Env{
            __client__: %Tesla.Client{adapter: nil, fun: nil, post: [], pre: []},
            __module__: Tesla,
            body: match_body(),
            headers: [
              {"connection", "keep-alive"},
              {"date", "Sun, 30 Jan 2022 17:41:38 GMT"},
              {"vary", "Accept-Encoding"},
              {"content-length", "29271"},
              {"content-type", "application/json;charset=utf-8"},
              {"x-app-rate-limit", "20:1,100:120"},
              {"x-app-rate-limit-count", "2:1,2:120"},
              {"x-method-rate-limit", "250:10"},
              {"x-method-rate-limit-count", "1:10"},
              {"x-riot-edge-trace-id", "5593d40a-a820-44be-b502-e729cb5b877f"},
              {"access-control-allow-origin", "*"},
              {"access-control-allow-methods", "GET, PUT, DELETE, POST, OPTIONS"},
              {"access-control-allow-headers",
               "DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range"},
              {"access-control-expose-headers", "Content-Length,Content-Range"}
            ],
            method: :get,
            opts: [],
            query: [],
            status: 200,
            url: "https://americas.api.riotgames.com/lol/match/v5/matches/NA1_4196830561"
          }
        }
      String.contains?(request_url, "/lol/match/v5/matches/by-puuid/c-52HREuK2bXfFnbDCKgwPKfAeV5k6ovUoUaxW4MD9ANyVJy4q2yUPH3qYcY02SQ2HcHbAE1H0Fetg/ids") and String.contains?(request_url, "&startTime=")->
        {:ok,
          %Tesla.Env{
            __client__: %Tesla.Client{adapter: nil, fun: nil, post: [], pre: []},
            __module__: Tesla,
            body: "[]",
            headers: [
              {"connection", "keep-alive"},
              {"date", "Sun, 30 Jan 2022 18:18:52 GMT"},
              {"vary", "Accept-Encoding"},
              {"content-length", "2"},
              {"content-type", "application/json;charset=utf-8"},
              {"x-app-rate-limit", "20:1,100:120"},
              {"x-app-rate-limit-count", "1:1,15:120"},
              {"x-method-rate-limit", "500:10"},
              {"x-method-rate-limit-count", "3:10"},
              {"x-riot-edge-trace-id", "a98abcca-dd09-4ee4-9784-a7fd4b05f05c"},
              {"access-control-allow-origin", "*"},
              {"access-control-allow-methods", "GET, PUT, DELETE, POST, OPTIONS"},
              {"access-control-allow-headers",
               "DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range"},
              {"access-control-expose-headers", "Content-Length,Content-Range"}
            ],
            method: :get,
            opts: [],
            query: [],
            status: 200,
            url: "https://americas.api.riotgames.com/lol/match/v5/matches/by-puuid/c-52HREuK2bXfFnbDCKgwPKfAeV5k6ovUoUaxW4MD9ANyVJy4q2yUPH3qYcY02SQ2HcHbAE1H0Fetg/ids"
          }
        }
      String.contains?(request_url, "/lol/match/v5/matches/by-puuid/hZcp9W_2_rnn16QpLxno0h0HD-cnS8YFXzfQHuGWuGWmfMNwVdu8GY966aYMDUR_87JW0PBf-X0zog/ids") ->
        {:ok,
        %Tesla.Env{
          __client__: %Tesla.Client{adapter: nil, fun: nil, post: [], pre: []},
          __module__: Tesla,
          body: "[]",
          headers: [
            {"connection", "keep-alive"},
            {"date", "Sun, 30 Jan 2022 18:18:49 GMT"},
            {"vary", "Accept-Encoding"},
            {"content-length", "2"},
            {"content-type", "application/json;charset=utf-8"},
            {"x-app-rate-limit", "20:1,100:120"},
            {"x-app-rate-limit-count", "1:1,13:120"},
            {"x-method-rate-limit", "500:10"},
            {"x-method-rate-limit-count", "1:10"},
            {"x-riot-edge-trace-id", "c5b89a20-9d54-4795-889a-4f630edb8a6f"},
            {"access-control-allow-origin", "*"},
            {"access-control-allow-methods", "GET, PUT, DELETE, POST, OPTIONS"},
            {"access-control-allow-headers",
             "DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range"},
            {"access-control-expose-headers", "Content-Length,Content-Range"}
          ],
          method: :get,
          opts: [],
          query: [],
          status: 200,
          url: "https://americas.api.riotgames.com/lol/match/v5/matches/by-puuid/hZcp9W_2_rnn16QpLxno0h0HD-cnS8YFXzfQHuGWuGWmfMNwVdu8GY966aYMDUR_87JW0PBf-X0zog/ids"
        }
      }
      String.contains?(request_url, "/lol/match/v5/matches/by-puuid/0W2J3OvUNYYhpcDPI1T1EW_ebbL1KP1v1EUqWV0wMFlI-iIgdYWqCHdyngNiHQBrC7TMF-Yq1HLvNQ/ids") ->
        {:ok,
        %Tesla.Env{
          __client__: %Tesla.Client{adapter: nil, fun: nil, post: [], pre: []},
          __module__: Tesla,
          body: "[\"NA1_4199334988\"]",
          headers: [
            {"connection", "keep-alive"},
            {"date", "Sun, 30 Jan 2022 18:19:41 GMT"},
            {"vary", "Accept-Encoding"},
            {"content-length", "18"},
            {"content-type", "application/json;charset=utf-8"},
            {"x-app-rate-limit", "20:1,100:120"},
            {"x-app-rate-limit-count", "1:1,4:120"},
            {"x-method-rate-limit", "500:10"},
            {"x-method-rate-limit-count", "7:10"},
            {"x-riot-edge-trace-id", "105c8d30-61ce-40fb-8820-0cb4725cd2bc"},
            {"access-control-allow-origin", "*"},
            {"access-control-allow-methods", "GET, PUT, DELETE, POST, OPTIONS"},
            {"access-control-allow-headers",
             "DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range"},
            {"access-control-expose-headers", "Content-Length,Content-Range"}
          ],
          method: :get,
          opts: [],
          query: [],
          status: 200,
          url: "https://americas.api.riotgames.com/lol/match/v5/matches/by-puuid/0W2J3OvUNYYhpcDPI1T1EW_ebbL1KP1v1EUqWV0wMFlI-iIgdYWqCHdyngNiHQBrC7TMF-Yq1HLvNQ/ids"
        }
      }
    end
  end

  def match_body() do
    "{\"metadata\":{\"dataVersion\":\"2\",\"matchId\":\"NA1_4196830561\"," <>
        "\"participants\":[\"hZcp9W_2_rnn16QpLxno0h0HD-cnS8YFXzfQHuGWuGWmfMNwVdu8GY966aYMDUR_87JW0PBf-X0zog\",\"c-52HREuK2bXfFnbDCKgwPKfAeV5k6ovUoUaxW4MD9ANyVJy4q2yUPH3qYcY02SQ2HcHbAE1H0Fetg\",\"0W2J3OvUNYYhpcDPI1T1EW_ebbL1KP1v1EUqWV0wMFlI-iIgdYWqCHdyngNiHQBrC7TMF-Yq1HLvNQ\"]" <>
      "}," <>
      "\"info\":{\"gameCreation\":1643405055000,\"gameDuration\":1192,\"gameEndTimestamp\":1643406483974,\"gameId\":4196830561,\"gameMode\":\"URF\",\"gameName\":\"teambuilder-match-4196830561\",\"gameStartTimestamp\":1643405291369,\"gameType\":\"MATCHED_GAME\",\"gameVersion\":\"12.2.419.1399\",\"mapId\":11," <>
      "\"participants\":[" <>
        "{\"assists\":10,\"baronKills\":0,\"bountyLevel\":0,\"champExperience\":17355,\"champLevel\":17,\"championId\":876,\"championName\":\"Lillia\",\"championTransform\":0,\"consumablesPurchased\":2,\"damageDealtToBuildings\":2348,\"damageDealtToObjectives\":11053,\"damageDealtToTurrets\":2348,\"damageSelfMitigated\":11712,\"deaths\":8,\"detectorWardsPlaced\":0,\"doubleKills\":1,\"dragonKills\":1,\"firstBloodAssist\":false,\"firstBloodKill\":false,\"firstTowerAssist\":true,\"firstTowerKill\":false,\"gameEndedInEarlySurrender\":false,\"gameEndedInSurrender\":false,\"goldEarned\":15233,\"goldSpent\":14300,\"individualPosition\":\"Invalid\",\"inhibitorKills\":0,\"inhibitorTakedowns\":0,\"inhibitorsLost\":3,\"item0\":3024,\"item1\":6653,\"item2\":4637,\"item3\":3047,\"item4\":3157,\"item5\":4629,\"item6\":3363,\"itemsPurchased\":24,\"killingSprees\":1,\"kills\":7,\"lane\":\"NONE\",\"largestCriticalStrike\":0,\"largestKillingSpree\":4,\"largestMultiKill\":2,\"longestTimeSpentLiving\":331,\"magicDamageDealt\":70098,\"magicDamageDealtToChampions\":17378,\"magicDamageTaken\":15593,\"neutralMinionsKilled\":13,\"nexusKills\":0,\"nexusLost\":1,\"nexusTakedowns\":0,\"objectivesStolen\":0,\"objectivesStolenAssists\":0,\"participantId\":1,\"pentaKills\":0,\"perks\":{\"statPerks\":{\"defense\":5002,\"flex\":5008,\"offense\":5008},\"styles\":[{\"description\":\"primaryStyle\",\"selections\":[{\"perk\":8230,\"var1\":11,\"var2\":0,\"var3\":0},{\"perk\":8275,\"var1\":18,\"var2\":0,\"var3\":0},{\"perk\":8210,\"var1\":1,\"var2\":0,\"var3\":0},{\"perk\":8236,\"var1\":48,\"var2\":0,\"var3\":0}],\"style\":8200},{\"description\":\"subStyle\",\"selections\":[{\"perk\":9111,\"var1\":1503,\"var2\":340,\"var3\":0},{\"perk\":8014,\"var1\":540,\"var2\":0,\"var3\":0}],\"style\":8000}]},\"physicalDamageDealt\":800,\"physicalDamageDealtToChampions\":192,\"physicalDamageTaken\":14679,\"profileIcon\":5166,\"puuid\":\"hZcp9W_2_rnn16QpLxno0h0HD-cnS8YFXzfQHuGWuGWmfMNwVdu8GY966aYMDUR_87JW0PBf-X0zog\",\"quadraKills\":0,\"riotIdName\":\"\",\"riotIdTagline\":\"\",\"role\":\"SUPPORT\",\"sightWardsBoughtInGame\":0,\"spell1Casts\":149,\"spell2Casts\":38,\"spell3Casts\":129,\"spell4Casts\":11,\"summoner1Casts\":9,\"summoner1Id\":4,\"summoner2Casts\":9,\"summoner2Id\":14,\"summonerId\":\"5G9nYxgZNeQ7YHQYll-umZlL56yiTSf2TqrUFgdRTJ-AcEU\",\"summonerLevel\":212,\"summonerName\":\"Freyskol\",\"teamEarlySurrendered\":false,\"teamId\":100,\"teamPosition\":\"\",\"timeCCingOthers\":20,\"timePlayed\":1192,\"totalDamageDealt\":93840,\"totalDamageDealtToChampions\":22906,\"totalDamageShieldedOnTeammates\":0,\"totalDamageTaken\":30935,\"totalHeal\":4359,\"totalHealsOnTeammates\":0,\"totalMinionsKilled\":92,\"totalTimeCCDealt\":213,\"totalTimeSpentDead\":240,\"totalUnitsHealed\":1,\"tripleKills\":0,\"trueDamageDealt\":22941,\"trueDamageDealtToChampions\":5335,\"trueDamageTaken\":662,\"turretKills\":0,\"turretTakedowns\":2,\"turretsLost\":11,\"unrealKills\":0,\"visionScore\":22,\"visionWardsBoughtInGame\":0,\"wardsKilled\":1,\"wardsPlaced\":13,\"win\":false}," <>
        "{\"assists\":5,\"baronKills\":0,\"bountyLevel\":0,\"champExperience\":19577,\"champLevel\":18,\"championId\":11,\"championName\":\"MasterYi\",\"championTransform\":0,\"consumablesPurchased\":2,\"damageDealtToBuildings\":10711,\"damageDealtToObjectives\":18135,\"damageDealtToTurrets\":10711,\"damageSelfMitigated\":16087,\"deaths\":16,\"detectorWardsPlaced\":0,\"doubleKills\":4,\"dragonKills\":0,\"firstBloodAssist\":false,\"firstBloodKill\":false,\"firstTowerAssist\":false,\"firstTowerKill\":true,\"gameEndedInEarlySurrender\":false,\"gameEndedInSurrender\":false,\"goldEarned\":20322,\"goldSpent\":18200,\"individualPosition\":\"Invalid\",\"inhibitorKills\":1,\"inhibitorTakedowns\":1,\"inhibitorsLost\":3,\"item0\":6691,\"item1\":3006,\"item2\":6676,\"item3\":3072,\"item4\":3031,\"item5\":3153,\"item6\":3340,\"itemsPurchased\":24,\"killingSprees\":5,\"kills\":19,\"lane\":\"NONE\",\"largestCriticalStrike\":1049,\"largestKillingSpree\":6,\"largestMultiKill\":3,\"longestTimeSpentLiving\":136,\"magicDamageDealt\":465,\"magicDamageDealtToChampions\":131,\"magicDamageTaken\":9317,\"neutralMinionsKilled\":25,\"nexusKills\":0,\"nexusLost\":1,\"nexusTakedowns\":0,\"objectivesStolen\":0,\"objectivesStolenAssists\":0,\"participantId\":3,\"pentaKills\":0,\"perks\":{\"statPerks\":{\"defense\":5002,\"flex\":5008,\"offense\":5005},\"styles\":[{\"description\":\"primaryStyle\",\"selections\":[{\"perk\":9923,\"var1\":56,\"var2\":77,\"var3\":0},{\"perk\":8143,\"var1\":1047,\"var2\":0,\"var3\":0},{\"perk\":8138,\"var1\":18,\"var2\":0,\"var3\":0},{\"perk\":8105,\"var1\":12,\"var2\":5,\"var3\":0}],\"style\":8100},{\"description\":\"subStyle\",\"selections\":[{\"perk\":9111,\"var1\":970,\"var2\":480,\"var3\":0},{\"perk\":9104,\"var1\":8,\"var2\":20,\"var3\":0}],\"style\":8000}]},\"physicalDamageDealt\":140741,\"physicalDamageDealtToChampions\":35147,\"physicalDamageTaken\":18839,\"profileIcon\":1114,\"puuid\":\"c-52HREuK2bXfFnbDCKgwPKfAeV5k6ovUoUaxW4MD9ANyVJy4q2yUPH3qYcY02SQ2HcHbAE1H0Fetg\",\"quadraKills\":0,\"riotIdName\":\"\",\"riotIdTagline\":\"\",\"role\":\"SUPPORT\",\"sightWardsBoughtInGame\":0,\"spell1Casts\":79,\"spell2Casts\":9,\"spell3Casts\":50,\"spell4Casts\":21,\"summoner1Casts\":12,\"summoner1Id\":4,\"summoner2Casts\":15,\"summoner2Id\":3,\"summonerId\":\"99ciO_cF_MaFo81yvXIpQtlm796sawKhDUDl52Lho_kss1w\",\"summonerLevel\":352,\"summonerName\":\"Asdf\",\"teamEarlySurrendered\":false,\"teamId\":100,\"teamPosition\":\"\",\"timeCCingOthers\":7,\"timePlayed\":1192,\"totalDamageDealt\":159665,\"totalDamageDealtToChampions\":46074,\"totalDamageShieldedOnTeammates\":0,\"totalDamageTaken\":28976,\"totalHeal\":1428,\"totalHealsOnTeammates\":0,\"totalMinionsKilled\":91,\"totalTimeCCDealt\":82,\"totalTimeSpentDead\":389,\"totalUnitsHealed\":1,\"tripleKills\":2,\"trueDamageDealt\":18459,\"trueDamageDealtToChampions\":10795,\"trueDamageTaken\":819,\"turretKills\":4,\"turretTakedowns\":4,\"turretsLost\":11,\"unrealKills\":0,\"visionScore\":15,\"visionWardsBoughtInGame\":0,\"wardsKilled\":0,\"wardsPlaced\":10,\"win\":false}," <>
        "{\"assists\":6,\"baronKills\":0,\"bountyLevel\":0,\"champExperience\":15784,\"champLevel\":16,\"championId\":412,\"championName\":\"Thresh\",\"championTransform\":0,\"consumablesPurchased\":1,\"damageDealtToBuildings\":347,\"damageDealtToObjectives\":4992,\"damageDealtToTurrets\":347,\"damageSelfMitigated\":14066,\"deaths\":9,\"detectorWardsPlaced\":0,\"doubleKills\":0,\"dragonKills\":0,\"firstBloodAssist\":false,\"firstBloodKill\":false,\"firstTowerAssist\":false,\"firstTowerKill\":false,\"gameEndedInEarlySurrender\":false,\"gameEndedInSurrender\":false,\"goldEarned\":12506,\"goldSpent\":11750,\"individualPosition\":\"Invalid\",\"inhibitorKills\":0,\"inhibitorTakedowns\":0,\"inhibitorsLost\":3,\"item0\":3006,\"item1\":6691,\"item2\":6676,\"item3\":3031,\"item4\":0,\"item5\":0,\"item6\":3364,\"itemsPurchased\":15,\"killingSprees\":0,\"kills\":1,\"lane\":\"NONE\",\"largestCriticalStrike\":573,\"largestKillingSpree\":0,\"largestMultiKill\":1,\"longestTimeSpentLiving\":284,\"magicDamageDealt\":50863,\"magicDamageDealtToChampions\":7183,\"magicDamageTaken\":8221,\"neutralMinionsKilled\":16,\"nexusKills\":0,\"nexusLost\":1,\"nexusTakedowns\":0,\"objectivesStolen\":0,\"objectivesStolenAssists\":0,\"participantId\":4,\"pentaKills\":0,\"perks\":{\"statPerks\":{\"defense\":5002,\"flex\":5008,\"offense\":5005},\"styles\":[{\"description\":\"primaryStyle\",\"selections\":[{\"perk\":9923,\"var1\":20,\"var2\":60,\"var3\":0},{\"perk\":8143,\"var1\":103,\"var2\":0,\"var3\":0},{\"perk\":8138,\"var1\":8,\"var2\":0,\"var3\":0},{\"perk\":8105,\"var1\":11,\"var2\":4,\"var3\":0}],\"style\":8100},{\"description\":\"subStyle\",\"selections\":[{\"perk\":9111,\"var1\":253,\"var2\":140,\"var3\":0},{\"perk\":9104,\"var1\":14,\"var2\":10,\"var3\":0}],\"style\":8000}]},\"physicalDamageDealt\":35474,\"physicalDamageDealtToChampions\":2588,\"physicalDamageTaken\":7385,\"profileIcon\":5091,\"puuid\":\"0W2J3OvUNYYhpcDPI1T1EW_ebbL1KP1v1EUqWV0wMFlI-iIgdYWqCHdyngNiHQBrC7TMF-Yq1HLvNQ\",\"quadraKills\":0,\"riotIdName\":\"\",\"riotIdTagline\":\"\",\"role\":\"SUPPORT\",\"sightWardsBoughtInGame\":0,\"spell1Casts\":21,\"spell2Casts\":52,\"spell3Casts\":42,\"spell4Casts\":9,\"summoner1Casts\":7,\"summoner1Id\":4,\"summoner2Casts\":8,\"summoner2Id\":3,\"summonerId\":\"MNKUmsHwVu48auLrFdS-Zi2sucyci-kWABz2QyEPDx5Q2f8\",\"summonerLevel\":458,\"summonerName\":\"Hoo Lee Phuc\",\"teamEarlySurrendered\":false,\"teamId\":100,\"teamPosition\":\"\",\"timeCCingOthers\":24,\"timePlayed\":1192,\"totalDamageDealt\":88083,\"totalDamageDealtToChampions\":10008,\"totalDamageShieldedOnTeammates\":2321,\"totalDamageTaken\":15779,\"totalHeal\":570,\"totalHealsOnTeammates\":0,\"totalMinionsKilled\":93,\"totalTimeCCDealt\":127,\"totalTimeSpentDead\":221,\"totalUnitsHealed\":1,\"tripleKills\":0,\"trueDamageDealt\":1746,\"trueDamageDealtToChampions\":236,\"trueDamageTaken\":171,\"turretKills\":0,\"turretTakedowns\":0,\"turretsLost\":11,\"unrealKills\":0,\"visionScore\":22,\"visionWardsBoughtInGame\":0,\"wardsKilled\":2,\"wardsPlaced\":11,\"win\":false}" <>
      "]," <>
      "\"platformId\":\"NA1\",\"queueId\":900,\"teams\":[" <>
      "{\"bans\":[],\"objectives\":{\"baron\":{\"first\":false,\"kills\":0},\"champion\":{\"first\":false,\"kills\":44},\"dragon\":{\"first\":false,\"kills\":2},\"inhibitor\":{\"first\":true,\"kills\":1},\"riftHerald\":{\"first\":false,\"kills\":0},\"tower\":{\"first\":true,\"kills\":6}},\"teamId\":100,\"win\":false}," <>
      "{\"bans\":[],\"objectives\":{\"baron\":{\"first\":true,\"kills\":1},\"champion\":{\"first\":true,\"kills\":54},\"dragon\":{\"first\":true,\"kills\":2},\"inhibitor\":{\"first\":false,\"kills\":3},\"riftHerald\":{\"first\":false,\"kills\":0},\"tower\":{\"first\":false,\"kills\":11}},\"teamId\":200,\"win\":true}]," <>
      "\"tournamentCode\":\"\"}}"
  end
end
