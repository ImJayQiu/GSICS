require 'test_helper'

class EmployeerPhotosControllerTest < ActionController::TestCase
  setup do
    @employeer_photo = employeer_photos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employeer_photos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employeer_photo" do
    assert_difference('EmployeerPhoto.count') do
      post :create, :employeer_photo => @employeer_photo.attributes
    end

    assert_redirected_to employeer_photo_path(assigns(:employeer_photo))
  end

  test "should show employeer_photo" do
    get :show, :id => @employeer_photo.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @employeer_photo.to_param
    assert_response :success
  end

  test "should update employeer_photo" do
    put :update, :id => @employeer_photo.to_param, :employeer_photo => @employeer_photo.attributes
    assert_redirected_to employeer_photo_path(assigns(:employeer_photo))
  end

  test "should destroy employeer_photo" do
    assert_difference('EmployeerPhoto.count', -1) do
      delete :destroy, :id => @employeer_photo.to_param
    end

    assert_redirected_to employeer_photos_path
  end
end
