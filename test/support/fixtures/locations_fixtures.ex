defmodule Realtime.LocationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Realtime.Locations` context.
  """

  @doc """
  Generate a country.
  """
  def country_fixture(attrs \\ %{}) do
    {:ok, country} =
      attrs
      |> Enum.into(%{
        abbreviation: "some abbreviation",
        name: "some name"
      })
      |> Realtime.Locations.create_country()

    country
  end
end
