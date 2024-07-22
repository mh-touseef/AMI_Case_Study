defmodule ExAssignment.Repo.Migrations.AlterTableTodosAddIsRecommended do
  use Ecto.Migration

  def change do
    alter table(:todos) do
      add(:is_recommended, :boolean, default: false, null: false)
    end
  end
end
