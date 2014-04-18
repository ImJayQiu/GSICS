require 'test_helper'

class SilicashiplotsControllerTest < ActionController::TestCase
  setup do
    @silicashiplot = silicashiplots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:silicashiplots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create silicashiplot" do
    assert_difference('Silicashiplot.count') do
      post :create, :silicashiplot => @silicashiplot.attributes
    end

    assert_redirected_to silicashiplot_path(assigns(:silicashiplot))
  end

  test "should show silicashiplot" do
    get :show, :id => @silicashiplot.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @silicashiplot.to_param
    assert_response :success
  end

  test "should update silicashiplot" do
    put :update, :id => @silicashiplot.to_param, :silicashiplot => @silicashiplot.attributes
    assert_redirected_to silicashiplot_path(assigns(:silicashiplot))
  end

  test "should destroy silicashiplot" do
    assert_difference('Silicashiplot.count', -1) do
      delete :destroy, :id => @silicashiplot.to_param
    end

    assert_redirected_to silicashiplots_path
  end
end
