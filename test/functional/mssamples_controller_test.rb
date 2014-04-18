require 'test_helper'

class MssamplesControllerTest < ActionController::TestCase
  setup do
    @mssample = mssamples(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mssamples)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mssample" do
    assert_difference('Mssample.count') do
      post :create, :mssample => @mssample.attributes
    end

    assert_redirected_to mssample_path(assigns(:mssample))
  end

  test "should show mssample" do
    get :show, :id => @mssample.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mssample.to_param
    assert_response :success
  end

  test "should update mssample" do
    put :update, :id => @mssample.to_param, :mssample => @mssample.attributes
    assert_redirected_to mssample_path(assigns(:mssample))
  end

  test "should destroy mssample" do
    assert_difference('Mssample.count', -1) do
      delete :destroy, :id => @mssample.to_param
    end

    assert_redirected_to mssamples_path
  end
end
