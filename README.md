# Blitz

* Given a valid summoner_name and region will fetch all summoners this summoner has
played with in the last 5 matches. This data is returned to the caller as a list of
summoner names (see below). Also, the following occurs:
* * Once fetched, all summoners will be monitored for new matches every minute
for the next hour
* * When a summoner plays a new match, the match id is logged to the console,
such as:
* * * `Summoner <summoner name> completed match <match id>`
* The returned data should be formatted as:
```
[summoner_name_1, summoner_name_2, ...]**
```
## Configuration
* You will need a Riot Games API key. Set it in your local environment
** `export RIOT_KEY=<your riot key here>`
* You will need to tell the app which type of API key you have, like this
** `export RIOT_KEY_TYPE=personal`

Don't worry, if you neglect either of these, you should receive an error message telling you how to fix it.

## Running the app
* Pull the git repo
* In the top level directory of the app, run
```bash
mix run --no-halt
```

You will be prompted to enter a summoner name and region.
Results will be returned to the console as described above.

## Running the tests
`mix test`
