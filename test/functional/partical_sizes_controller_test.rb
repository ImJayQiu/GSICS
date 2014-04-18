require 'test_helper'

class ParticalSizesControllerTest < ActionController::TestCase
  setup do
    @partical_size = partical_sizes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:partical_sizes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create partical_size" do
    assert_difference('ParticalSize.count') do
      post :create, :partical_size => @partical_size.attributes
    end

    assert_redirected_to partical_size_path(assigns(:partical_size))
  end

  test "should show partical_size" do
    get :show, :id => @partical_size.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @partical_size.to_param
    assert_response :success
  end

  test "should update partical_size" do
    put :update, :id => @partical_size.to_param, :partical_size => @partical_size.attributes
    assert_redirected_to partical_size_path(assigns(:partical_size))
  end

  test "should destroy partical_size" do
    assert_difference('ParticalSize.count', -1) do
      delete :destroy, :id => @partical_size.to_param
    end

    assert_redirected_to partical_sizes_path
  end
end
