defmodule Blitz.Server do
  use GenServer

  alias Riot.Client

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  @impl true
  def init(:ok) do
    Process.send(self(), :respond_and_watch,[])
    {:ok, %{}}
  end

  @impl true
  def handle_info(:respond_and_watch, _state) do
    {params, participants} = respond()
    Process.send_after(self(), :show_new_matches, 60_000)
    {:noreply, %{last_tick: DateTime.utc_now(), minute_count: 0, participants: participants, params: params}}
  end

  @impl true
  def handle_info(:show_new_matches, state) do
    {this_tick, this_minute_count} = show_new_matches(state)
    {:noreply, Map.merge(state, %{last_tick: this_tick, minute_count: this_minute_count})}
  end

  def respond() do
    params = terminal_handler().get_summoner_and_region()
    participants = Client.get_recent_participants(params)
    generate_initial_response(participants)
    {params, participants}
  end

  def show_new_matches(state) do
    this_minute_count = state.minute_count + 1
    this_tick = DateTime.add(state.last_tick, 60, :second)
    {remaining_milliseconds, this_tick, this_minute_count} = calculate_next_tick(this_tick, this_minute_count)
    if(this_minute_count <= 60) do
      get_participant_matches(state)
      Process.send_after(self(), :show_new_matches, remaining_milliseconds)
    else
      System.stop(0)
    end
    {this_tick, this_minute_count}
  end

  defp calculate_next_tick(this_tick, this_minute_count) do
    slew = DateTime.diff(DateTime.utc_now(), this_tick, :millisecond)
    if slew <= 60000 do
      remaining_milliseconds = 60_000 - slew
      {remaining_milliseconds, this_tick, this_minute_count}
    else
      # Took too long, skipped a tick
      this_tick = DateTime.add(this_tick, 60, :second)
      this_minute_count = this_minute_count + 1
      {0, this_tick, this_minute_count}
    end
  end

  defp generate_initial_response(participants) do
    # The spec said we return the data to the "caller", no way of telling if this
    # caller is embedded somewhere else in this app, an external HTTP client
    # or a terminal user. At least this covers 2 of the cases, an internal caller
    # could get the output string formatted as described in the spec
    # and the terminal user also gets the output.
    response = participants
    |> extract_participant_names()
    |> present_participants()
    IO.puts response
    response
  end

  defp extract_participant_names(participants) do
    participants
    |> Enum.map(&(&1.summoner_name))
  end

  defp present_participants(names) do
    # String formatted as per the spec
    "[" <> Enum.join(names, ", ") <> "]"
  end

  def get_participant_matches(%{participants: participants, params: %{region: region}, last_tick: last_tick}) do
    # Filtering our Riot API requests by ticks locked to 60 second intervals ensures
    # we don't miss any matches, though we may get duplicates from the slew window.
    last_tick_seconds = DateTime.to_unix(last_tick)

    # Rate limits put a hard cut-off on how many participants we can query for matches
    # in 1 minute
    participants = Enum.take(participants, Client.one_minute_limit())

    interval = Client.interval_for_count(Enum.count(participants))

    participants
    |> Enum.map(fn participant ->
      match_ids = Client.get_match_ids_since(%{puuid: participant.puuid, region: region, start_time: last_tick_seconds})
      # TODO: find out if the business wants to de-dup matches that were caught
      # in the overlap time between the last tick and the last actual query time on the
      # Riot server. This adds complexity and memory usage, so we won't do it unless is it desired.
      present_participant_matches(%{summoner_name: participant.summoner_name, match_ids: match_ids})
      # TODO: figure out if higher accuracy is desired, if so we could make the trade-off
      # of adding higher complexity and memory by having another Process.send_after and another handle_info
      # that calculates slew for each call here and dials in the next call time closer.
      :timer.sleep(interval)
    end)
  end

  defp present_participant_matches(participant_matches) do
    Enum.each(participant_matches.match_ids, fn match_id ->
      IO.puts "Summoner #{participant_matches.summoner_name} completed match #{match_id}"
    end)
  end

  defp terminal_handler() do
    Enum.into(Application.get_env(:blitz, :terminal_input), %{}).handler
  end
end
