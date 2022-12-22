defmodule RealtimeWeb.Schema.Subscriptions.Country do
  use Absinthe.Schema.Notation

  object :country_subscriptions do
    @desc "Subscribe to country changes"
    field :country_change, :country do
      arg :id, non_null(:id)

      config fn args, _res ->
        {:ok, topic: args.id}
      end
    end
  end
end
