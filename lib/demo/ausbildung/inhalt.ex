defmodule Demo.Ausbildung.Inhalt do
  use Ecto.Schema
  import Ecto.Changeset

  schema "inhalte" do
    field :wochentag, :string
    field :inhalt, :string
    belongs_to :berichtsheft, Demo.Ausbildung.Berichtsheft
    timestamps()
  end

  @doc false
  def changeset(inhalt, attrs) do
    inhalt
    |> cast(attrs, [:wochentag, :inhalt])
    |> validate_required([:wochentag, :inhalt])
  end
end
