require 'test_helper'

class VNetweightsControllerTest < ActionController::TestCase
  setup do
    @v_netweight = v_netweights(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:v_netweights)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create v_netweight" do
    assert_difference('VNetweight.count') do
      post :create, :v_netweight => @v_netweight.attributes
    end

    assert_redirected_to v_netweight_path(assigns(:v_netweight))
  end

  test "should show v_netweight" do
    get :show, :id => @v_netweight.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @v_netweight.to_param
    assert_response :success
  end

  test "should update v_netweight" do
    put :update, :id => @v_netweight.to_param, :v_netweight => @v_netweight.attributes
    assert_redirected_to v_netweight_path(assigns(:v_netweight))
  end

  test "should destroy v_netweight" do
    assert_difference('VNetweight.count', -1) do
      delete :destroy, :id => @v_netweight.to_param
    end

    assert_redirected_to v_netweights_path
  end
end
