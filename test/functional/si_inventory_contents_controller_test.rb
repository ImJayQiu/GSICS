require 'test_helper'

class SiInventoryContentsControllerTest < ActionController::TestCase
  setup do
    @si_inventory_content = si_inventory_contents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:si_inventory_contents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create si_inventory_content" do
    assert_difference('SiInventoryContent.count') do
      post :create, :si_inventory_content => @si_inventory_content.attributes
    end

    assert_redirected_to si_inventory_content_path(assigns(:si_inventory_content))
  end

  test "should show si_inventory_content" do
    get :show, :id => @si_inventory_content.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @si_inventory_content.to_param
    assert_response :success
  end

  test "should update si_inventory_content" do
    put :update, :id => @si_inventory_content.to_param, :si_inventory_content => @si_inventory_content.attributes
    assert_redirected_to si_inventory_content_path(assigns(:si_inventory_content))
  end

  test "should destroy si_inventory_content" do
    assert_difference('SiInventoryContent.count', -1) do
      delete :destroy, :id => @si_inventory_content.to_param
    end

    assert_redirected_to si_inventory_contents_path
  end
end
