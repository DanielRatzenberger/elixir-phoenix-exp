defmodule Demo.Repo.Migrations.CreateInhalte do
  use Ecto.Migration

  def change do
    create table(:inhalte) do
      add :berichtsheft_id, references(:berichtshefte)
      add :wochentag, :string
      add :inhalt, :string

      timestamps()
    end
  end
end
