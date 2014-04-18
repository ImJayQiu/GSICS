require 'test_helper'

class WarehouseSuppliersControllerTest < ActionController::TestCase
  setup do
    @warehouse_supplier = warehouse_suppliers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:warehouse_suppliers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create warehouse_supplier" do
    assert_difference('WarehouseSupplier.count') do
      post :create, :warehouse_supplier => @warehouse_supplier.attributes
    end

    assert_redirected_to warehouse_supplier_path(assigns(:warehouse_supplier))
  end

  test "should show warehouse_supplier" do
    get :show, :id => @warehouse_supplier.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @warehouse_supplier.to_param
    assert_response :success
  end

  test "should update warehouse_supplier" do
    put :update, :id => @warehouse_supplier.to_param, :warehouse_supplier => @warehouse_supplier.attributes
    assert_redirected_to warehouse_supplier_path(assigns(:warehouse_supplier))
  end

  test "should destroy warehouse_supplier" do
    assert_difference('WarehouseSupplier.count', -1) do
      delete :destroy, :id => @warehouse_supplier.to_param
    end

    assert_redirected_to warehouse_suppliers_path
  end
end
