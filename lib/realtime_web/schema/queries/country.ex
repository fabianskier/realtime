defmodule RealtimeWeb.Schema.Queries.Country do
  use Absinthe.Schema.Notation

  alias RealtimeWeb.Resolvers

  object :country_queries do
    field :country, :country do
      arg :id, non_null(:id)

      resolve(&Resolvers.Country.find/2)
    end
  end
end
