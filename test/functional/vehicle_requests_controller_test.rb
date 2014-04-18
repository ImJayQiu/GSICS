require 'test_helper'

class VehicleRequestsControllerTest < ActionController::TestCase
  setup do
    @vehicle_request = vehicle_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vehicle_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vehicle_request" do
    assert_difference('VehicleRequest.count') do
      post :create, :vehicle_request => @vehicle_request.attributes
    end

    assert_redirected_to vehicle_request_path(assigns(:vehicle_request))
  end

  test "should show vehicle_request" do
    get :show, :id => @vehicle_request.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @vehicle_request.to_param
    assert_response :success
  end

  test "should update vehicle_request" do
    put :update, :id => @vehicle_request.to_param, :vehicle_request => @vehicle_request.attributes
    assert_redirected_to vehicle_request_path(assigns(:vehicle_request))
  end

  test "should destroy vehicle_request" do
    assert_difference('VehicleRequest.count', -1) do
      delete :destroy, :id => @vehicle_request.to_param
    end

    assert_redirected_to vehicle_requests_path
  end
end
