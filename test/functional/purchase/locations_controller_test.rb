require 'test_helper'

class Purchase::LocationsControllerTest < ActionController::TestCase
  setup do
    @purchase_location = purchase_locations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purchase_locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchase_location" do
    assert_difference('Purchase::Location.count') do
      post :create, :purchase_location => @purchase_location.attributes
    end

    assert_redirected_to purchase_location_path(assigns(:purchase_location))
  end

  test "should show purchase_location" do
    get :show, :id => @purchase_location.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @purchase_location.to_param
    assert_response :success
  end

  test "should update purchase_location" do
    put :update, :id => @purchase_location.to_param, :purchase_location => @purchase_location.attributes
    assert_redirected_to purchase_location_path(assigns(:purchase_location))
  end

  test "should destroy purchase_location" do
    assert_difference('Purchase::Location.count', -1) do
      delete :destroy, :id => @purchase_location.to_param
    end

    assert_redirected_to purchase_locations_path
  end
end
