require 'test_helper'

class CoasiliconsControllerTest < ActionController::TestCase
  setup do
    @coasilicon = coasilicons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coasilicons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coasilicon" do
    assert_difference('Coasilicon.count') do
      post :create, :coasilicon => @coasilicon.attributes
    end

    assert_redirected_to coasilicon_path(assigns(:coasilicon))
  end

  test "should show coasilicon" do
    get :show, :id => @coasilicon.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @coasilicon.to_param
    assert_response :success
  end

  test "should update coasilicon" do
    put :update, :id => @coasilicon.to_param, :coasilicon => @coasilicon.attributes
    assert_redirected_to coasilicon_path(assigns(:coasilicon))
  end

  test "should destroy coasilicon" do
    assert_difference('Coasilicon.count', -1) do
      delete :destroy, :id => @coasilicon.to_param
    end

    assert_redirected_to coasilicons_path
  end
end
