defmodule Demo.Repo.Migrations.CreateBerichtshefte do
  use Ecto.Migration

  def change do
    create table(:berichtshefte) do
      add :berichtsheftnummer, :integer
      add :datum_von, :date
      add :datum_bis, :date

      timestamps()
    end
  end
end
