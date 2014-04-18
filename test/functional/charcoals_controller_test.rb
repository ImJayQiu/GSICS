require 'test_helper'

class CharcoalsControllerTest < ActionController::TestCase
  setup do
    @charcoal = charcoals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:charcoals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create charcoal" do
    assert_difference('Charcoal.count') do
      post :create, :charcoal => @charcoal.attributes
    end

    assert_redirected_to charcoal_path(assigns(:charcoal))
  end

  test "should show charcoal" do
    get :show, :id => @charcoal.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @charcoal.to_param
    assert_response :success
  end

  test "should update charcoal" do
    put :update, :id => @charcoal.to_param, :charcoal => @charcoal.attributes
    assert_redirected_to charcoal_path(assigns(:charcoal))
  end

  test "should destroy charcoal" do
    assert_difference('Charcoal.count', -1) do
      delete :destroy, :id => @charcoal.to_param
    end

    assert_redirected_to charcoals_path
  end
end
