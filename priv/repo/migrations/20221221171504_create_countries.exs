defmodule Realtime.Repo.Migrations.CreateCountries do
  use Ecto.Migration

  def change do
    create table(:countries) do
      add :name, :string
      add :abbreviation, :string

      timestamps()
    end
  end
end
