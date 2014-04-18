require 'test_helper'

class RmRatesControllerTest < ActionController::TestCase
  setup do
    @rm_rate = rm_rates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rm_rates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rm_rate" do
    assert_difference('RmRate.count') do
      post :create, :rm_rate => @rm_rate.attributes
    end

    assert_redirected_to rm_rate_path(assigns(:rm_rate))
  end

  test "should show rm_rate" do
    get :show, :id => @rm_rate.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @rm_rate.to_param
    assert_response :success
  end

  test "should update rm_rate" do
    put :update, :id => @rm_rate.to_param, :rm_rate => @rm_rate.attributes
    assert_redirected_to rm_rate_path(assigns(:rm_rate))
  end

  test "should destroy rm_rate" do
    assert_difference('RmRate.count', -1) do
      delete :destroy, :id => @rm_rate.to_param
    end

    assert_redirected_to rm_rates_path
  end
end
