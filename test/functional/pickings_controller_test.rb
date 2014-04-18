require 'test_helper'

class PickingsControllerTest < ActionController::TestCase
  setup do
    @picking = pickings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pickings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create picking" do
    assert_difference('Picking.count') do
      post :create, :picking => @picking.attributes
    end

    assert_redirected_to picking_path(assigns(:picking))
  end

  test "should show picking" do
    get :show, :id => @picking.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @picking.to_param
    assert_response :success
  end

  test "should update picking" do
    put :update, :id => @picking.to_param, :picking => @picking.attributes
    assert_redirected_to picking_path(assigns(:picking))
  end

  test "should destroy picking" do
    assert_difference('Picking.count', -1) do
      delete :destroy, :id => @picking.to_param
    end

    assert_redirected_to pickings_path
  end
end
