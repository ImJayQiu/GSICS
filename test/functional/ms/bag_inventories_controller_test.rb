require 'test_helper'

class Ms::BagInventoriesControllerTest < ActionController::TestCase
  setup do
    @ms_bag_inventory = ms_bag_inventories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ms_bag_inventories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ms_bag_inventory" do
    assert_difference('Ms::BagInventory.count') do
      post :create, :ms_bag_inventory => @ms_bag_inventory.attributes
    end

    assert_redirected_to ms_bag_inventory_path(assigns(:ms_bag_inventory))
  end

  test "should show ms_bag_inventory" do
    get :show, :id => @ms_bag_inventory.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ms_bag_inventory.to_param
    assert_response :success
  end

  test "should update ms_bag_inventory" do
    put :update, :id => @ms_bag_inventory.to_param, :ms_bag_inventory => @ms_bag_inventory.attributes
    assert_redirected_to ms_bag_inventory_path(assigns(:ms_bag_inventory))
  end

  test "should destroy ms_bag_inventory" do
    assert_difference('Ms::BagInventory.count', -1) do
      delete :destroy, :id => @ms_bag_inventory.to_param
    end

    assert_redirected_to ms_bag_inventories_path
  end
end
