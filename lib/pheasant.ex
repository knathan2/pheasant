defmodule Pheasant do
  @moduledoc """
  Documentation for Pheasant.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Pheasant.hello
      :world

  """
  def hello do
    :world
  end

  def timeStop do 
    url = "https://commonlayer.bt4u.org/stops/1414"
    json = HTTPoison.get!(url).body
    {:ok, response} = Poison.Parser.parse(json)
    File.write("/home/knathan2/Documents/pheasant/lib/stopTimes.html", json)
    map = hd(response)
    %{"busStopDetailsBaseUrl" => 3, "busStopDetailsHtml" => html} = map
    t = tl(Floki.find(html, ".col-xs-3.col-md-3"))
    Enum.map(t, fn obj -> hd(elem(obj, 2)) end)
  end
end
