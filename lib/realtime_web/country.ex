defmodule RealtimeWeb.Country do
  alias Realtime.Locations

  def find(%{id: id}) do
    try do
      {:ok, Locations.get_country!(id)}
    rescue
      Ecto.NoResultsError ->
        {:error, %{message: "country not found", details: %{id: id}}}
    end
  end
end
