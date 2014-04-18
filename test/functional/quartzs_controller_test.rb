require 'test_helper'

class QuartzsControllerTest < ActionController::TestCase
  setup do
    @quartz = quartzs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quartzs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quartz" do
    assert_difference('Quartz.count') do
      post :create, :quartz => @quartz.attributes
    end

    assert_redirected_to quartz_path(assigns(:quartz))
  end

  test "should show quartz" do
    get :show, :id => @quartz.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @quartz.to_param
    assert_response :success
  end

  test "should update quartz" do
    put :update, :id => @quartz.to_param, :quartz => @quartz.attributes
    assert_redirected_to quartz_path(assigns(:quartz))
  end

  test "should destroy quartz" do
    assert_difference('Quartz.count', -1) do
      delete :destroy, :id => @quartz.to_param
    end

    assert_redirected_to quartzs_path
  end
end
