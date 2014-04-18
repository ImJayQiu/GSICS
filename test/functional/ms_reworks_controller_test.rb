require 'test_helper'

class MsReworksControllerTest < ActionController::TestCase
  setup do
    @ms_rework = ms_reworks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ms_reworks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ms_rework" do
    assert_difference('MsRework.count') do
      post :create, :ms_rework => @ms_rework.attributes
    end

    assert_redirected_to ms_rework_path(assigns(:ms_rework))
  end

  test "should show ms_rework" do
    get :show, :id => @ms_rework.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ms_rework.to_param
    assert_response :success
  end

  test "should update ms_rework" do
    put :update, :id => @ms_rework.to_param, :ms_rework => @ms_rework.attributes
    assert_redirected_to ms_rework_path(assigns(:ms_rework))
  end

  test "should destroy ms_rework" do
    assert_difference('MsRework.count', -1) do
      delete :destroy, :id => @ms_rework.to_param
    end

    assert_redirected_to ms_reworks_path
  end
end
