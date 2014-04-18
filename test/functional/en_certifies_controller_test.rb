require 'test_helper'

class EnCertifiesControllerTest < ActionController::TestCase
  setup do
    @en_certify = en_certifies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:en_certifies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create en_certify" do
    assert_difference('EnCertify.count') do
      post :create, :en_certify => @en_certify.attributes
    end

    assert_redirected_to en_certify_path(assigns(:en_certify))
  end

  test "should show en_certify" do
    get :show, :id => @en_certify.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @en_certify.to_param
    assert_response :success
  end

  test "should update en_certify" do
    put :update, :id => @en_certify.to_param, :en_certify => @en_certify.attributes
    assert_redirected_to en_certify_path(assigns(:en_certify))
  end

  test "should destroy en_certify" do
    assert_difference('EnCertify.count', -1) do
      delete :destroy, :id => @en_certify.to_param
    end

    assert_redirected_to en_certifies_path
  end
end
