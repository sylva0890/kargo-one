defmodule KargoBe.Unit.Truck do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trucks" do
    field :kir_path, :string
    field :license_number, :string
    field :license_type, :string
    field :production_year, :integer
    field :status, :boolean, default: false
    field :stnk_path, :string
    field :truck_type, :string

    timestamps()
  end

  @doc false
  def changeset(truck, attrs) do
    truck
    |> cast(attrs, [:license_number, :license_type, :truck_type, :production_year, :stnk_path, :kir_path, :status])
    |> validate_required([:license_number, :license_type, :truck_type, :production_year, :stnk_path, :kir_path, :status])
  end
end
