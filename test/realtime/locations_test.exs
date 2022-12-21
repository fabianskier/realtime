defmodule Realtime.LocationsTest do
  use Realtime.DataCase

  alias Realtime.Locations

  describe "countries" do
    alias Realtime.Locations.Country

    import Realtime.LocationsFixtures

    @invalid_attrs %{abbreviation: nil, name: nil}

    test "list_countries/0 returns all countries" do
      country = country_fixture()
      assert Locations.list_countries() == [country]
    end

    test "get_country!/1 returns the country with given id" do
      country = country_fixture()
      assert Locations.get_country!(country.id) == country
    end

    test "create_country/1 with valid data creates a country" do
      valid_attrs = %{abbreviation: "some abbreviation", name: "some name"}

      assert {:ok, %Country{} = country} = Locations.create_country(valid_attrs)
      assert country.abbreviation == "some abbreviation"
      assert country.name == "some name"
    end

    test "create_country/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Locations.create_country(@invalid_attrs)
    end

    test "update_country/2 with valid data updates the country" do
      country = country_fixture()
      update_attrs = %{abbreviation: "some updated abbreviation", name: "some updated name"}

      assert {:ok, %Country{} = country} = Locations.update_country(country, update_attrs)
      assert country.abbreviation == "some updated abbreviation"
      assert country.name == "some updated name"
    end

    test "update_country/2 with invalid data returns error changeset" do
      country = country_fixture()
      assert {:error, %Ecto.Changeset{}} = Locations.update_country(country, @invalid_attrs)
      assert country == Locations.get_country!(country.id)
    end

    test "delete_country/1 deletes the country" do
      country = country_fixture()
      assert {:ok, %Country{}} = Locations.delete_country(country)
      assert_raise Ecto.NoResultsError, fn -> Locations.get_country!(country.id) end
    end

    test "change_country/1 returns a country changeset" do
      country = country_fixture()
      assert %Ecto.Changeset{} = Locations.change_country(country)
    end
  end
end
