require 'test_helper'

class QuartzPhotosControllerTest < ActionController::TestCase
  setup do
    @quartz_photo = quartz_photos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quartz_photos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quartz_photo" do
    assert_difference('QuartzPhoto.count') do
      post :create, :quartz_photo => @quartz_photo.attributes
    end

    assert_redirected_to quartz_photo_path(assigns(:quartz_photo))
  end

  test "should show quartz_photo" do
    get :show, :id => @quartz_photo.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @quartz_photo.to_param
    assert_response :success
  end

  test "should update quartz_photo" do
    put :update, :id => @quartz_photo.to_param, :quartz_photo => @quartz_photo.attributes
    assert_redirected_to quartz_photo_path(assigns(:quartz_photo))
  end

  test "should destroy quartz_photo" do
    assert_difference('QuartzPhoto.count', -1) do
      delete :destroy, :id => @quartz_photo.to_param
    end

    assert_redirected_to quartz_photos_path
  end
end
