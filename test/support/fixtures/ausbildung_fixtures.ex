defmodule Demo.AusbildungFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Demo.Ausbildung` context.
  """

  @doc """
  Generate a berichtsheft.
  """
  def berichtsheft_fixture(attrs \\ %{}) do
    {:ok, berichtsheft} =
      attrs
      |> Enum.into(%{
        berichtsheftnummer: 42,
        datum_von: ~D[2023-07-18],
        datum_bis: ~D[2023-07-18],
        inhalt: "some inhalt"
      })
      |> Demo.Ausbildung.create_berichtsheft()

    berichtsheft
  end

  @doc """
  Generate a inhalt.
  """
  def inhalt_fixture(attrs \\ %{}) do
    {:ok, inhalt} =
      attrs
      |> Enum.into(%{
        wochentag: "some wochentag",
        inhalt: "some inhalt"
      })
      |> Demo.Ausbildung.create_inhalt()

    inhalt
  end
end
