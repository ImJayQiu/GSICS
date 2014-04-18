require 'test_helper'

class Ms::BagsControllerTest < ActionController::TestCase
  setup do
    @ms_bag = ms_bags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ms_bags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ms_bag" do
    assert_difference('Ms::Bag.count') do
      post :create, :ms_bag => @ms_bag.attributes
    end

    assert_redirected_to ms_bag_path(assigns(:ms_bag))
  end

  test "should show ms_bag" do
    get :show, :id => @ms_bag.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ms_bag.to_param
    assert_response :success
  end

  test "should update ms_bag" do
    put :update, :id => @ms_bag.to_param, :ms_bag => @ms_bag.attributes
    assert_redirected_to ms_bag_path(assigns(:ms_bag))
  end

  test "should destroy ms_bag" do
    assert_difference('Ms::Bag.count', -1) do
      delete :destroy, :id => @ms_bag.to_param
    end

    assert_redirected_to ms_bags_path
  end
end
