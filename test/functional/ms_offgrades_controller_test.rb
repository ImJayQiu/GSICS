require 'test_helper'

class MsOffgradesControllerTest < ActionController::TestCase
  setup do
    @ms_offgrade = ms_offgrades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ms_offgrades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ms_offgrade" do
    assert_difference('MsOffgrade.count') do
      post :create, :ms_offgrade => @ms_offgrade.attributes
    end

    assert_redirected_to ms_offgrade_path(assigns(:ms_offgrade))
  end

  test "should show ms_offgrade" do
    get :show, :id => @ms_offgrade.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ms_offgrade.to_param
    assert_response :success
  end

  test "should update ms_offgrade" do
    put :update, :id => @ms_offgrade.to_param, :ms_offgrade => @ms_offgrade.attributes
    assert_redirected_to ms_offgrade_path(assigns(:ms_offgrade))
  end

  test "should destroy ms_offgrade" do
    assert_difference('MsOffgrade.count', -1) do
      delete :destroy, :id => @ms_offgrade.to_param
    end

    assert_redirected_to ms_offgrades_path
  end
end
