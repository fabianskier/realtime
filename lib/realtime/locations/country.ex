defmodule Realtime.Locations.Country do
  use Ecto.Schema
  import Ecto.Changeset

  schema "countries" do
    field :abbreviation, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(country, attrs) do
    country
    |> cast(attrs, [:name, :abbreviation])
    |> validate_required([:name, :abbreviation])
  end
end
