require 'test_helper'

class MsshipbagsControllerTest < ActionController::TestCase
  setup do
    @msshipbag = msshipbags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:msshipbags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create msshipbag" do
    assert_difference('Msshipbag.count') do
      post :create, :msshipbag => @msshipbag.attributes
    end

    assert_redirected_to msshipbag_path(assigns(:msshipbag))
  end

  test "should show msshipbag" do
    get :show, :id => @msshipbag.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @msshipbag.to_param
    assert_response :success
  end

  test "should update msshipbag" do
    put :update, :id => @msshipbag.to_param, :msshipbag => @msshipbag.attributes
    assert_redirected_to msshipbag_path(assigns(:msshipbag))
  end

  test "should destroy msshipbag" do
    assert_difference('Msshipbag.count', -1) do
      delete :destroy, :id => @msshipbag.to_param
    end

    assert_redirected_to msshipbags_path
  end
end
