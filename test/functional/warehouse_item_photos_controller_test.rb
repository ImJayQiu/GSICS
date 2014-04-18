require 'test_helper'

class WarehouseItemPhotosControllerTest < ActionController::TestCase
  setup do
    @warehouse_item_photo = warehouse_item_photos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:warehouse_item_photos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create warehouse_item_photo" do
    assert_difference('WarehouseItemPhoto.count') do
      post :create, :warehouse_item_photo => @warehouse_item_photo.attributes
    end

    assert_redirected_to warehouse_item_photo_path(assigns(:warehouse_item_photo))
  end

  test "should show warehouse_item_photo" do
    get :show, :id => @warehouse_item_photo.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @warehouse_item_photo.to_param
    assert_response :success
  end

  test "should update warehouse_item_photo" do
    put :update, :id => @warehouse_item_photo.to_param, :warehouse_item_photo => @warehouse_item_photo.attributes
    assert_redirected_to warehouse_item_photo_path(assigns(:warehouse_item_photo))
  end

  test "should destroy warehouse_item_photo" do
    assert_difference('WarehouseItemPhoto.count', -1) do
      delete :destroy, :id => @warehouse_item_photo.to_param
    end

    assert_redirected_to warehouse_item_photos_path
  end
end
