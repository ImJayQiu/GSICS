require 'test_helper'

class SecurityCaseMediaControllerTest < ActionController::TestCase
  setup do
    @security_case_medium = security_case_media(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:security_case_media)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create security_case_medium" do
    assert_difference('SecurityCaseMedium.count') do
      post :create, :security_case_medium => @security_case_medium.attributes
    end

    assert_redirected_to security_case_medium_path(assigns(:security_case_medium))
  end

  test "should show security_case_medium" do
    get :show, :id => @security_case_medium.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @security_case_medium.to_param
    assert_response :success
  end

  test "should update security_case_medium" do
    put :update, :id => @security_case_medium.to_param, :security_case_medium => @security_case_medium.attributes
    assert_redirected_to security_case_medium_path(assigns(:security_case_medium))
  end

  test "should destroy security_case_medium" do
    assert_difference('SecurityCaseMedium.count', -1) do
      delete :destroy, :id => @security_case_medium.to_param
    end

    assert_redirected_to security_case_media_path
  end
end
