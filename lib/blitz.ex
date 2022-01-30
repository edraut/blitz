defmodule Blitz do
  @moduledoc """
  Documentation for `Blitz`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Blitz.hello()
      :world

  """
  use Application

  def start(_type, _args) do
    opts = [strategy: :one_for_one, name: Blitz.Application]

    Blitz.Supervisor.start_link(opts)
  end
end
