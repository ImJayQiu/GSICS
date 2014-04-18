require 'test_helper'

class Warehouse::CheckinsControllerTest < ActionController::TestCase
  setup do
    @warehouse_checkin = warehouse_checkins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:warehouse_checkins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create warehouse_checkin" do
    assert_difference('Warehouse::Checkin.count') do
      post :create, warehouse_checkin: { date: @warehouse_checkin.date, operator: @warehouse_checkin.operator, p_code: @warehouse_checkin.p_code, remark: @warehouse_checkin.remark, w_qty: @warehouse_checkin.w_qty }
    end

    assert_redirected_to warehouse_checkin_path(assigns(:warehouse_checkin))
  end

  test "should show warehouse_checkin" do
    get :show, id: @warehouse_checkin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @warehouse_checkin
    assert_response :success
  end

  test "should update warehouse_checkin" do
    patch :update, id: @warehouse_checkin, warehouse_checkin: { date: @warehouse_checkin.date, operator: @warehouse_checkin.operator, p_code: @warehouse_checkin.p_code, remark: @warehouse_checkin.remark, w_qty: @warehouse_checkin.w_qty }
    assert_redirected_to warehouse_checkin_path(assigns(:warehouse_checkin))
  end

  test "should destroy warehouse_checkin" do
    assert_difference('Warehouse::Checkin.count', -1) do
      delete :destroy, id: @warehouse_checkin
    end

    assert_redirected_to warehouse_checkins_path
  end
end
