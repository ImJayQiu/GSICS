require 'test_helper'

class Power::FurnacesControllerTest < ActionController::TestCase
  setup do
    @power_furnace = power_furnaces(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:power_furnaces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create power_furnace" do
    assert_difference('Power::Furnace.count') do
      post :create, :power_furnace => @power_furnace.attributes
    end

    assert_redirected_to power_furnace_path(assigns(:power_furnace))
  end

  test "should show power_furnace" do
    get :show, :id => @power_furnace.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @power_furnace.to_param
    assert_response :success
  end

  test "should update power_furnace" do
    put :update, :id => @power_furnace.to_param, :power_furnace => @power_furnace.attributes
    assert_redirected_to power_furnace_path(assigns(:power_furnace))
  end

  test "should destroy power_furnace" do
    assert_difference('Power::Furnace.count', -1) do
      delete :destroy, :id => @power_furnace.to_param
    end

    assert_redirected_to power_furnaces_path
  end
end
