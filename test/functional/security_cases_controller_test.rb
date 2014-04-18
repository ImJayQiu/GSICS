require 'test_helper'

class SecurityCasesControllerTest < ActionController::TestCase
  setup do
    @security_case = security_cases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:security_cases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create security_case" do
    assert_difference('SecurityCase.count') do
      post :create, :security_case => @security_case.attributes
    end

    assert_redirected_to security_case_path(assigns(:security_case))
  end

  test "should show security_case" do
    get :show, :id => @security_case.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @security_case.to_param
    assert_response :success
  end

  test "should update security_case" do
    put :update, :id => @security_case.to_param, :security_case => @security_case.attributes
    assert_redirected_to security_case_path(assigns(:security_case))
  end

  test "should destroy security_case" do
    assert_difference('SecurityCase.count', -1) do
      delete :destroy, :id => @security_case.to_param
    end

    assert_redirected_to security_cases_path
  end
end
