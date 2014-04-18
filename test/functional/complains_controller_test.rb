require 'test_helper'

class ComplainsControllerTest < ActionController::TestCase
  setup do
    @complain = complains(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:complains)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create complain" do
    assert_difference('Complain.count') do
      post :create, :complain => @complain.attributes
    end

    assert_redirected_to complain_path(assigns(:complain))
  end

  test "should show complain" do
    get :show, :id => @complain.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @complain.to_param
    assert_response :success
  end

  test "should update complain" do
    put :update, :id => @complain.to_param, :complain => @complain.attributes
    assert_redirected_to complain_path(assigns(:complain))
  end

  test "should destroy complain" do
    assert_difference('Complain.count', -1) do
      delete :destroy, :id => @complain.to_param
    end

    assert_redirected_to complains_path
  end
end
