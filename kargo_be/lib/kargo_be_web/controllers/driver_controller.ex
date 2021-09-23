defmodule KargoBeWeb.DriverController do
  use KargoBeWeb, :controller

  alias KargoBe.Drivers
  alias KargoBe.Drivers.Driver

  action_fallback KargoBeWeb.FallbackController

  def index(conn, _params) do
    drivers = Drivers.list_drivers()
    render(conn, "index.json", drivers: drivers)
  end

  def create(conn, %{"driver" => driver_params}) do
    driver_params = Map.put(driver_params, "created_at", NaiveDateTime.local_now())
    with {:ok, %Driver{} = driver} <- Drivers.create_driver(driver_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.driver_path(conn, :show, driver))
      |> render("show.json", driver: driver)
    end
  end

  def show(conn, %{"id" => id}) do
    driver = Drivers.get_driver!(id)
    render(conn, "show.json", driver: driver)
  end

  def update(conn, %{"id" => id, "driver" => driver_params}) do
    driver = Drivers.get_driver!(id)

    with {:ok, %Driver{} = driver} <- Drivers.update_driver(driver, driver_params) do
      render(conn, "show.json", driver: driver)
    end
  end

  def delete(conn, %{"id" => id}) do
    driver = Drivers.get_driver!(id)

    with {:ok, %Driver{}} <- Drivers.delete_driver(driver) do
      send_resp(conn, :no_content, "")
    end
  end
end
