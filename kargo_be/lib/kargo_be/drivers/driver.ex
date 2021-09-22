defmodule KargoBe.Drivers.Driver do
  use Ecto.Schema
  import Ecto.Changeset

  schema "drivers" do
    field :created_at, :naive_datetime
    field :name, :string
    field :phone_number, :string
    field :status, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(driver, attrs) do
    driver
    |> cast(attrs, [:name, :phone_number, :status, :created_at])
    |> validate_required([:name, :phone_number, :status, :created_at])
  end
end
