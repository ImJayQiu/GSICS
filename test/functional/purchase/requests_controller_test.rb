require 'test_helper'

class Purchase::RequestsControllerTest < ActionController::TestCase
  setup do
    @purchase_request = purchase_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purchase_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchase_request" do
    assert_difference('Purchase::Request.count') do
      post :create, :purchase_request => @purchase_request.attributes
    end

    assert_redirected_to purchase_request_path(assigns(:purchase_request))
  end

  test "should show purchase_request" do
    get :show, :id => @purchase_request.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @purchase_request.to_param
    assert_response :success
  end

  test "should update purchase_request" do
    put :update, :id => @purchase_request.to_param, :purchase_request => @purchase_request.attributes
    assert_redirected_to purchase_request_path(assigns(:purchase_request))
  end

  test "should destroy purchase_request" do
    assert_difference('Purchase::Request.count', -1) do
      delete :destroy, :id => @purchase_request.to_param
    end

    assert_redirected_to purchase_requests_path
  end
end
