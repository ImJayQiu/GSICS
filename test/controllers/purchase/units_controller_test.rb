require 'test_helper'

class Purchase::UnitsControllerTest < ActionController::TestCase
  setup do
    @purchase_unit = purchase_units(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purchase_units)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchase_unit" do
    assert_difference('Purchase::Unit.count') do
      post :create, purchase_unit: { code: @purchase_unit.code, remark: @purchase_unit.remark, unit: @purchase_unit.unit }
    end

    assert_redirected_to purchase_unit_path(assigns(:purchase_unit))
  end

  test "should show purchase_unit" do
    get :show, id: @purchase_unit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @purchase_unit
    assert_response :success
  end

  test "should update purchase_unit" do
    patch :update, id: @purchase_unit, purchase_unit: { code: @purchase_unit.code, remark: @purchase_unit.remark, unit: @purchase_unit.unit }
    assert_redirected_to purchase_unit_path(assigns(:purchase_unit))
  end

  test "should destroy purchase_unit" do
    assert_difference('Purchase::Unit.count', -1) do
      delete :destroy, id: @purchase_unit
    end

    assert_redirected_to purchase_units_path
  end
end
