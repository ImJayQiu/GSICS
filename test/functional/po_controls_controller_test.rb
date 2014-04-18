require 'test_helper'

class PoControlsControllerTest < ActionController::TestCase
  setup do
    @po_control = po_controls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:po_controls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create po_control" do
    assert_difference('PoControl.count') do
      post :create, :po_control => @po_control.attributes
    end

    assert_redirected_to po_control_path(assigns(:po_control))
  end

  test "should show po_control" do
    get :show, :id => @po_control.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @po_control.to_param
    assert_response :success
  end

  test "should update po_control" do
    put :update, :id => @po_control.to_param, :po_control => @po_control.attributes
    assert_redirected_to po_control_path(assigns(:po_control))
  end

  test "should destroy po_control" do
    assert_difference('PoControl.count', -1) do
      delete :destroy, :id => @po_control.to_param
    end

    assert_redirected_to po_controls_path
  end
end
