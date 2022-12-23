defmodule RealtimeWeb.Country do
  alias Realtime.Locations
  alias RealtimeWeb.Schema.ChangesetErrors

  def find(%{id: id}) do
    try do
      {:ok, Locations.get_country!(id)}
    rescue
      Ecto.NoResultsError ->
        {:error, %{message: "country not found", details: %{id: id}}}
    end
  end

  def create_country(args) do
    case Locations.create_country(args) do
      {:error, changeset} ->
        {:error,
         message: "Could not create country", details: ChangesetErrors.error_details(changeset)}

      {:ok, country} ->
        publish_country_change(country)
        {:ok, country}
    end
  end

  def update_country(args) do
    country = Locations.get_country!(args[:id])
    changeset = %{name: args[:name], abbreviation: args[:abbreviation]}

    case Locations.update_country(country, changeset) do
      {:error, changeset} ->
        {:error,
         message: "Could not update country", details: ChangesetErrors.error_details(changeset)}

      {:ok, country} ->
        publish_country_change(country)
        {:ok, country}
    end
  end

  defp publish_country_change(country) do
    Absinthe.Subscription.publish(
      RealtimeWeb.Endpoint,
      country,
      country_change: country.id
    )
  end
end
