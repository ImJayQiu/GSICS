require 'test_helper'

class Interviews::ItsControllerTest < ActionController::TestCase
  setup do
    @interviews_it = interviews_its(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:interviews_its)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create interviews_it" do
    assert_difference('Interviews::It.count') do
      post :create, :interviews_it => @interviews_it.attributes
    end

    assert_redirected_to interviews_it_path(assigns(:interviews_it))
  end

  test "should show interviews_it" do
    get :show, :id => @interviews_it.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @interviews_it.to_param
    assert_response :success
  end

  test "should update interviews_it" do
    put :update, :id => @interviews_it.to_param, :interviews_it => @interviews_it.attributes
    assert_redirected_to interviews_it_path(assigns(:interviews_it))
  end

  test "should destroy interviews_it" do
    assert_difference('Interviews::It.count', -1) do
      delete :destroy, :id => @interviews_it.to_param
    end

    assert_redirected_to interviews_its_path
  end
end
