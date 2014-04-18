require 'test_helper'

class WarehouseItemsControllerTest < ActionController::TestCase
  setup do
    @warehouse_item = warehouse_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:warehouse_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create warehouse_item" do
    assert_difference('WarehouseItem.count') do
      post :create, :warehouse_item => @warehouse_item.attributes
    end

    assert_redirected_to warehouse_item_path(assigns(:warehouse_item))
  end

  test "should show warehouse_item" do
    get :show, :id => @warehouse_item.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @warehouse_item.to_param
    assert_response :success
  end

  test "should update warehouse_item" do
    put :update, :id => @warehouse_item.to_param, :warehouse_item => @warehouse_item.attributes
    assert_redirected_to warehouse_item_path(assigns(:warehouse_item))
  end

  test "should destroy warehouse_item" do
    assert_difference('WarehouseItem.count', -1) do
      delete :destroy, :id => @warehouse_item.to_param
    end

    assert_redirected_to warehouse_items_path
  end
end
