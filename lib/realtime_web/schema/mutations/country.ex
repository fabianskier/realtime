defmodule RealtimeWeb.Schema.Mutations.Country do
  use Absinthe.Schema.Notation

  alias RealtimeWeb.Resolvers

  object :country_mutations do
    @desc "Create a new country"
    field :create_country, :country do
      arg :name, non_null(:string)
      arg :abbreviation, non_null(:string)

      resolve(&Resolvers.Country.create_country/2)
    end
  end
end
