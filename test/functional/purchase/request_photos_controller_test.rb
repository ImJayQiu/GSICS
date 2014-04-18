require 'test_helper'

class Purchase::RequestPhotosControllerTest < ActionController::TestCase
  setup do
    @purchase_request_photo = purchase_request_photos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purchase_request_photos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchase_request_photo" do
    assert_difference('Purchase::RequestPhoto.count') do
      post :create, :purchase_request_photo => @purchase_request_photo.attributes
    end

    assert_redirected_to purchase_request_photo_path(assigns(:purchase_request_photo))
  end

  test "should show purchase_request_photo" do
    get :show, :id => @purchase_request_photo.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @purchase_request_photo.to_param
    assert_response :success
  end

  test "should update purchase_request_photo" do
    put :update, :id => @purchase_request_photo.to_param, :purchase_request_photo => @purchase_request_photo.attributes
    assert_redirected_to purchase_request_photo_path(assigns(:purchase_request_photo))
  end

  test "should destroy purchase_request_photo" do
    assert_difference('Purchase::RequestPhoto.count', -1) do
      delete :destroy, :id => @purchase_request_photo.to_param
    end

    assert_redirected_to purchase_request_photos_path
  end
end
