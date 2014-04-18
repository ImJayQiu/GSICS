require 'test_helper'

class MsShippmentsControllerTest < ActionController::TestCase
  setup do
    @ms_shippment = ms_shippments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ms_shippments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ms_shippment" do
    assert_difference('MsShippment.count') do
      post :create, :ms_shippment => @ms_shippment.attributes
    end

    assert_redirected_to ms_shippment_path(assigns(:ms_shippment))
  end

  test "should show ms_shippment" do
    get :show, :id => @ms_shippment.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ms_shippment.to_param
    assert_response :success
  end

  test "should update ms_shippment" do
    put :update, :id => @ms_shippment.to_param, :ms_shippment => @ms_shippment.attributes
    assert_redirected_to ms_shippment_path(assigns(:ms_shippment))
  end

  test "should destroy ms_shippment" do
    assert_difference('MsShippment.count', -1) do
      delete :destroy, :id => @ms_shippment.to_param
    end

    assert_redirected_to ms_shippments_path
  end
end
