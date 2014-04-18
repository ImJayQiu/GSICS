require 'test_helper'

class Power::FactorsControllerTest < ActionController::TestCase
  setup do
    @power_factor = power_factors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:power_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create power_factor" do
    assert_difference('Power::Factor.count') do
      post :create, :power_factor => @power_factor.attributes
    end

    assert_redirected_to power_factor_path(assigns(:power_factor))
  end

  test "should show power_factor" do
    get :show, :id => @power_factor.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @power_factor.to_param
    assert_response :success
  end

  test "should update power_factor" do
    put :update, :id => @power_factor.to_param, :power_factor => @power_factor.attributes
    assert_redirected_to power_factor_path(assigns(:power_factor))
  end

  test "should destroy power_factor" do
    assert_difference('Power::Factor.count', -1) do
      delete :destroy, :id => @power_factor.to_param
    end

    assert_redirected_to power_factors_path
  end
end
