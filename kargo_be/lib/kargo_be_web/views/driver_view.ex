defmodule KargoBeWeb.DriverView do
  use KargoBeWeb, :view
  alias KargoBeWeb.DriverView

  def render("index.json", %{drivers: drivers}) do
    %{data: render_many(drivers, DriverView, "driver.json")}
  end

  def render("show.json", %{driver: driver}) do
    %{data: render_one(driver, DriverView, "driver.json")}
  end

  def render("driver.json", %{driver: driver}) do
    %{id: driver.id,
      name: driver.name,
      phone_number: driver.phone_number,
      status: driver.status,
      created_at: driver.created_at}
  end
end
