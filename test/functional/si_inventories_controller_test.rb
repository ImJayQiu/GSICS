require 'test_helper'

class SiInventoriesControllerTest < ActionController::TestCase
  setup do
    @si_inventory = si_inventories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:si_inventories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create si_inventory" do
    assert_difference('SiInventory.count') do
      post :create, :si_inventory => @si_inventory.attributes
    end

    assert_redirected_to si_inventory_path(assigns(:si_inventory))
  end

  test "should show si_inventory" do
    get :show, :id => @si_inventory.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @si_inventory.to_param
    assert_response :success
  end

  test "should update si_inventory" do
    put :update, :id => @si_inventory.to_param, :si_inventory => @si_inventory.attributes
    assert_redirected_to si_inventory_path(assigns(:si_inventory))
  end

  test "should destroy si_inventory" do
    assert_difference('SiInventory.count', -1) do
      delete :destroy, :id => @si_inventory.to_param
    end

    assert_redirected_to si_inventories_path
  end
end
