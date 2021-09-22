defmodule KargoBe.Repo.Migrations.CreateDrivers do
  use Ecto.Migration

  def change do
    create table(:drivers) do
      add :name, :string
      add :phone_number, :string
      add :status, :boolean, default: false, null: false
      add :created_at, :naive_datetime

      timestamps()
    end

  end
end
