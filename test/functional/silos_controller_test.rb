require 'test_helper'

class SilosControllerTest < ActionController::TestCase
  setup do
    @silo = silos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:silos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create silo" do
    assert_difference('Silo.count') do
      post :create, :silo => @silo.attributes
    end

    assert_redirected_to silo_path(assigns(:silo))
  end

  test "should show silo" do
    get :show, :id => @silo.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @silo.to_param
    assert_response :success
  end

  test "should update silo" do
    put :update, :id => @silo.to_param, :silo => @silo.attributes
    assert_redirected_to silo_path(assigns(:silo))
  end

  test "should destroy silo" do
    assert_difference('Silo.count', -1) do
      delete :destroy, :id => @silo.to_param
    end

    assert_redirected_to silos_path
  end
end
