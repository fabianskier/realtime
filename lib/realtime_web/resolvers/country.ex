defmodule RealtimeWeb.Resolvers.Country do
  alias RealtimeWeb.Country

  def find(%{id: id}, _) do
    id = String.to_integer(id)

    Country.find(%{id: id})
  end

  def create_country(args, _) do
    Country.create_country(args)
  end
end
