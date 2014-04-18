require 'test_helper'

class EnvMonitorsControllerTest < ActionController::TestCase
  setup do
    @env_monitor = env_monitors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:env_monitors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create env_monitor" do
    assert_difference('EnvMonitor.count') do
      post :create, :env_monitor => @env_monitor.attributes
    end

    assert_redirected_to env_monitor_path(assigns(:env_monitor))
  end

  test "should show env_monitor" do
    get :show, :id => @env_monitor.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @env_monitor.to_param
    assert_response :success
  end

  test "should update env_monitor" do
    put :update, :id => @env_monitor.to_param, :env_monitor => @env_monitor.attributes
    assert_redirected_to env_monitor_path(assigns(:env_monitor))
  end

  test "should destroy env_monitor" do
    assert_difference('EnvMonitor.count', -1) do
      delete :destroy, :id => @env_monitor.to_param
    end

    assert_redirected_to env_monitors_path
  end
end
