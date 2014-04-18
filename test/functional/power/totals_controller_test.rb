require 'test_helper'

class Power::TotalsControllerTest < ActionController::TestCase
  setup do
    @power_total = power_totals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:power_totals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create power_total" do
    assert_difference('Power::Total.count') do
      post :create, :power_total => @power_total.attributes
    end

    assert_redirected_to power_total_path(assigns(:power_total))
  end

  test "should show power_total" do
    get :show, :id => @power_total.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @power_total.to_param
    assert_response :success
  end

  test "should update power_total" do
    put :update, :id => @power_total.to_param, :power_total => @power_total.attributes
    assert_redirected_to power_total_path(assigns(:power_total))
  end

  test "should destroy power_total" do
    assert_difference('Power::Total.count', -1) do
      delete :destroy, :id => @power_total.to_param
    end

    assert_redirected_to power_totals_path
  end
end
