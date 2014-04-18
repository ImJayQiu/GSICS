require 'test_helper'

class CoasControllerTest < ActionController::TestCase
  setup do
    @coa = coas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coa" do
    assert_difference('Coa.count') do
      post :create, :coa => @coa.attributes
    end

    assert_redirected_to coa_path(assigns(:coa))
  end

  test "should show coa" do
    get :show, :id => @coa.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @coa.to_param
    assert_response :success
  end

  test "should update coa" do
    put :update, :id => @coa.to_param, :coa => @coa.attributes
    assert_redirected_to coa_path(assigns(:coa))
  end

  test "should destroy coa" do
    assert_difference('Coa.count', -1) do
      delete :destroy, :id => @coa.to_param
    end

    assert_redirected_to coas_path
  end
end
