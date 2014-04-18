require 'test_helper'

class EmployeersControllerTest < ActionController::TestCase
  setup do
    @employeer = employeers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employeers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employeer" do
    assert_difference('Employeer.count') do
      post :create, :employeer => @employeer.attributes
    end

    assert_redirected_to employeer_path(assigns(:employeer))
  end

  test "should show employeer" do
    get :show, :id => @employeer.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @employeer.to_param
    assert_response :success
  end

  test "should update employeer" do
    put :update, :id => @employeer.to_param, :employeer => @employeer.attributes
    assert_redirected_to employeer_path(assigns(:employeer))
  end

  test "should destroy employeer" do
    assert_difference('Employeer.count', -1) do
      delete :destroy, :id => @employeer.to_param
    end

    assert_redirected_to employeers_path
  end
end
