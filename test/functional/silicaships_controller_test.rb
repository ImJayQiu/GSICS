require 'test_helper'

class SilicashipsControllerTest < ActionController::TestCase
  setup do
    @silicaship = silicaships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:silicaships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create silicaship" do
    assert_difference('Silicaship.count') do
      post :create, :silicaship => @silicaship.attributes
    end

    assert_redirected_to silicaship_path(assigns(:silicaship))
  end

  test "should show silicaship" do
    get :show, :id => @silicaship.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @silicaship.to_param
    assert_response :success
  end

  test "should update silicaship" do
    put :update, :id => @silicaship.to_param, :silicaship => @silicaship.attributes
    assert_redirected_to silicaship_path(assigns(:silicaship))
  end

  test "should destroy silicaship" do
    assert_difference('Silicaship.count', -1) do
      delete :destroy, :id => @silicaship.to_param
    end

    assert_redirected_to silicaships_path
  end
end
