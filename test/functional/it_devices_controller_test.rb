require 'test_helper'

class ItDevicesControllerTest < ActionController::TestCase
  setup do
    @it_device = it_devices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:it_devices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create it_device" do
    assert_difference('ItDevice.count') do
      post :create, :it_device => @it_device.attributes
    end

    assert_redirected_to it_device_path(assigns(:it_device))
  end

  test "should show it_device" do
    get :show, :id => @it_device.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @it_device.to_param
    assert_response :success
  end

  test "should update it_device" do
    put :update, :id => @it_device.to_param, :it_device => @it_device.attributes
    assert_redirected_to it_device_path(assigns(:it_device))
  end

  test "should destroy it_device" do
    assert_difference('ItDevice.count', -1) do
      delete :destroy, :id => @it_device.to_param
    end

    assert_redirected_to it_devices_path
  end
end
