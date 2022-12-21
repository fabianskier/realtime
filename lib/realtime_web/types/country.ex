defmodule RealtimeWeb.Types.Country do
  use Absinthe.Schema.Notation

  @desc "A country object"
  object :country do
    field :id, :id
    field :name, :string
    field :abbreviation, :string
  end
end
