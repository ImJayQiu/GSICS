require 'test_helper'

class DailyreportsControllerTest < ActionController::TestCase
  setup do
    @dailyreport = dailyreports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dailyreports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dailyreport" do
    assert_difference('Dailyreport.count') do
      post :create, :dailyreport => @dailyreport.attributes
    end

    assert_redirected_to dailyreport_path(assigns(:dailyreport))
  end

  test "should show dailyreport" do
    get :show, :id => @dailyreport.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @dailyreport.to_param
    assert_response :success
  end

  test "should update dailyreport" do
    put :update, :id => @dailyreport.to_param, :dailyreport => @dailyreport.attributes
    assert_redirected_to dailyreport_path(assigns(:dailyreport))
  end

  test "should destroy dailyreport" do
    assert_difference('Dailyreport.count', -1) do
      delete :destroy, :id => @dailyreport.to_param
    end

    assert_redirected_to dailyreports_path
  end
end
