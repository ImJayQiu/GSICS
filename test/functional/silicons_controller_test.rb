require 'test_helper'

class SiliconsControllerTest < ActionController::TestCase
  setup do
    @silicon = silicons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:silicons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create silicon" do
    assert_difference('Silicon.count') do
      post :create, :silicon => @silicon.attributes
    end

    assert_redirected_to silicon_path(assigns(:silicon))
  end

  test "should show silicon" do
    get :show, :id => @silicon.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @silicon.to_param
    assert_response :success
  end

  test "should update silicon" do
    put :update, :id => @silicon.to_param, :silicon => @silicon.attributes
    assert_redirected_to silicon_path(assigns(:silicon))
  end

  test "should destroy silicon" do
    assert_difference('Silicon.count', -1) do
      delete :destroy, :id => @silicon.to_param
    end

    assert_redirected_to silicons_path
  end
end
