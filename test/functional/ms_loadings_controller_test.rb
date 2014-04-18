require 'test_helper'

class MsLoadingsControllerTest < ActionController::TestCase
  setup do
    @ms_loading = ms_loadings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ms_loadings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ms_loading" do
    assert_difference('MsLoading.count') do
      post :create, :ms_loading => @ms_loading.attributes
    end

    assert_redirected_to ms_loading_path(assigns(:ms_loading))
  end

  test "should show ms_loading" do
    get :show, :id => @ms_loading.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ms_loading.to_param
    assert_response :success
  end

  test "should update ms_loading" do
    put :update, :id => @ms_loading.to_param, :ms_loading => @ms_loading.attributes
    assert_redirected_to ms_loading_path(assigns(:ms_loading))
  end

  test "should destroy ms_loading" do
    assert_difference('MsLoading.count', -1) do
      delete :destroy, :id => @ms_loading.to_param
    end

    assert_redirected_to ms_loadings_path
  end
end
