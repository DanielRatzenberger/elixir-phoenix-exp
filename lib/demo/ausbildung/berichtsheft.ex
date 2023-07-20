defmodule Demo.Ausbildung.Berichtsheft do
  use Ecto.Schema
  import Ecto.Changeset

  schema "berichtshefte" do
    field :berichtsheftnummer, :integer
    field :datum_von, :date
    field :datum_bis, :date
    has_one :inhalt, Demo.Ausbildung.Inhalt

    timestamps()
  end

  @doc false
  def changeset(berichtsheft, attrs) do
    berichtsheft
    |> cast(attrs, [:berichtsheftnummer, :datum_von, :datum_bis])
    |> validate_required([:berichtsheftnummer, :datum_von, :datum_bis])
  end
end
