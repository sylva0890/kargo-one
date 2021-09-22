defmodule KargoBeWeb.DriverControllerTest do
  use KargoBeWeb.ConnCase

  alias KargoBe.Drivers
  alias KargoBe.Drivers.Driver

  @create_attrs %{
    created_at: ~N[2010-04-17 14:00:00],
    name: "some name",
    phone_number: 42,
    status: true
  }
  @update_attrs %{
    created_at: ~N[2011-05-18 15:01:01],
    name: "some updated name",
    phone_number: 43,
    status: false
  }
  @invalid_attrs %{created_at: nil, name: nil, phone_number: nil, status: nil}

  def fixture(:driver) do
    {:ok, driver} = Drivers.create_driver(@create_attrs)
    driver
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all drivers", %{conn: conn} do
      conn = get(conn, Routes.driver_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create driver" do
    test "renders driver when data is valid", %{conn: conn} do
      conn = post(conn, Routes.driver_path(conn, :create), driver: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.driver_path(conn, :show, id))

      assert %{
               "id" => id,
               "created_at" => "2010-04-17T14:00:00",
               "name" => "some name",
               "phone_number" => 42,
               "status" => true
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.driver_path(conn, :create), driver: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update driver" do
    setup [:create_driver]

    test "renders driver when data is valid", %{conn: conn, driver: %Driver{id: id} = driver} do
      conn = put(conn, Routes.driver_path(conn, :update, driver), driver: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.driver_path(conn, :show, id))

      assert %{
               "id" => id,
               "created_at" => "2011-05-18T15:01:01",
               "name" => "some updated name",
               "phone_number" => 43,
               "status" => false
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, driver: driver} do
      conn = put(conn, Routes.driver_path(conn, :update, driver), driver: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete driver" do
    setup [:create_driver]

    test "deletes chosen driver", %{conn: conn, driver: driver} do
      conn = delete(conn, Routes.driver_path(conn, :delete, driver))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.driver_path(conn, :show, driver))
      end
    end
  end

  defp create_driver(_) do
    driver = fixture(:driver)
    %{driver: driver}
  end
end
