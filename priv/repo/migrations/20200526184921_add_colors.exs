defmodule PhxTest.Repo.Migrations.AddColors do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :colors, :json
    end
  end
end
