require 'test_helper'

class MsLossesControllerTest < ActionController::TestCase
  setup do
    @ms_loss = ms_losses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ms_losses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ms_loss" do
    assert_difference('MsLoss.count') do
      post :create, :ms_loss => @ms_loss.attributes
    end

    assert_redirected_to ms_loss_path(assigns(:ms_loss))
  end

  test "should show ms_loss" do
    get :show, :id => @ms_loss.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ms_loss.to_param
    assert_response :success
  end

  test "should update ms_loss" do
    put :update, :id => @ms_loss.to_param, :ms_loss => @ms_loss.attributes
    assert_redirected_to ms_loss_path(assigns(:ms_loss))
  end

  test "should destroy ms_loss" do
    assert_difference('MsLoss.count', -1) do
      delete :destroy, :id => @ms_loss.to_param
    end

    assert_redirected_to ms_losses_path
  end
end
