require 'test_helper'

class MsshiplotsControllerTest < ActionController::TestCase
  setup do
    @msshiplot = msshiplots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:msshiplots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create msshiplot" do
    assert_difference('Msshiplot.count') do
      post :create, :msshiplot => @msshiplot.attributes
    end

    assert_redirected_to msshiplot_path(assigns(:msshiplot))
  end

  test "should show msshiplot" do
    get :show, :id => @msshiplot.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @msshiplot.to_param
    assert_response :success
  end

  test "should update msshiplot" do
    put :update, :id => @msshiplot.to_param, :msshiplot => @msshiplot.attributes
    assert_redirected_to msshiplot_path(assigns(:msshiplot))
  end

  test "should destroy msshiplot" do
    assert_difference('Msshiplot.count', -1) do
      delete :destroy, :id => @msshiplot.to_param
    end

    assert_redirected_to msshiplots_path
  end
end
