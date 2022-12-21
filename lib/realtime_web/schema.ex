defmodule RealtimeWeb.Schema do
  use Absinthe.Schema

  import_types(RealtimeWeb.Types.Country)
  import_types(RealtimeWeb.Schema.Queries.Country)
  import_types(RealtimeWeb.Schema.Mutations.Country)

  query do
    import_fields(:country_queries)
  end

  mutation do
    import_fields(:country_mutations)
  end
end
