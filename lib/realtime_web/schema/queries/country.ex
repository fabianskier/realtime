defmodule RealtimeWeb.Schema.Queries.Country do
  use Absinthe.Schema.Notation

  alias RealtimeWeb.Resolvers

  object :country_queries do
    @desc "Get a country by its id"
    field :country, :country do
      arg :id, non_null(:id)

      resolve(&Resolvers.Country.find/2)
    end

    @desc "Get all countries"
    field :countries, list_of(:country) do

      resolve(&Resolvers.Country.all/2)
    end
  end
end
