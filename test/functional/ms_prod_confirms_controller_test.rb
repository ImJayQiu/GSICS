require 'test_helper'

class MsProdConfirmsControllerTest < ActionController::TestCase
  setup do
    @ms_prod_confirm = ms_prod_confirms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ms_prod_confirms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ms_prod_confirm" do
    assert_difference('MsProdConfirm.count') do
      post :create, :ms_prod_confirm => @ms_prod_confirm.attributes
    end

    assert_redirected_to ms_prod_confirm_path(assigns(:ms_prod_confirm))
  end

  test "should show ms_prod_confirm" do
    get :show, :id => @ms_prod_confirm.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ms_prod_confirm.to_param
    assert_response :success
  end

  test "should update ms_prod_confirm" do
    put :update, :id => @ms_prod_confirm.to_param, :ms_prod_confirm => @ms_prod_confirm.attributes
    assert_redirected_to ms_prod_confirm_path(assigns(:ms_prod_confirm))
  end

  test "should destroy ms_prod_confirm" do
    assert_difference('MsProdConfirm.count', -1) do
      delete :destroy, :id => @ms_prod_confirm.to_param
    end

    assert_redirected_to ms_prod_confirms_path
  end
end
