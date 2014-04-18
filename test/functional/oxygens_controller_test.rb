require 'test_helper'

class OxygensControllerTest < ActionController::TestCase
  setup do
    @oxygen = oxygens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:oxygens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create oxygen" do
    assert_difference('Oxygen.count') do
      post :create, :oxygen => @oxygen.attributes
    end

    assert_redirected_to oxygen_path(assigns(:oxygen))
  end

  test "should show oxygen" do
    get :show, :id => @oxygen.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @oxygen.to_param
    assert_response :success
  end

  test "should update oxygen" do
    put :update, :id => @oxygen.to_param, :oxygen => @oxygen.attributes
    assert_redirected_to oxygen_path(assigns(:oxygen))
  end

  test "should destroy oxygen" do
    assert_difference('Oxygen.count', -1) do
      delete :destroy, :id => @oxygen.to_param
    end

    assert_redirected_to oxygens_path
  end
end
