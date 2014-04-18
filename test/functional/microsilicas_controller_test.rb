require 'test_helper'

class MicrosilicasControllerTest < ActionController::TestCase
  setup do
    @microsilica = microsilicas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:microsilicas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create microsilica" do
    assert_difference('Microsilica.count') do
      post :create, :microsilica => @microsilica.attributes
    end

    assert_redirected_to microsilica_path(assigns(:microsilica))
  end

  test "should show microsilica" do
    get :show, :id => @microsilica.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @microsilica.to_param
    assert_response :success
  end

  test "should update microsilica" do
    put :update, :id => @microsilica.to_param, :microsilica => @microsilica.attributes
    assert_redirected_to microsilica_path(assigns(:microsilica))
  end

  test "should destroy microsilica" do
    assert_difference('Microsilica.count', -1) do
      delete :destroy, :id => @microsilica.to_param
    end

    assert_redirected_to microsilicas_path
  end
end
