require 'test_helper'

class CharcoalDustsControllerTest < ActionController::TestCase
  setup do
    @charcoal_dust = charcoal_dusts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:charcoal_dusts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create charcoal_dust" do
    assert_difference('CharcoalDust.count') do
      post :create, :charcoal_dust => @charcoal_dust.attributes
    end

    assert_redirected_to charcoal_dust_path(assigns(:charcoal_dust))
  end

  test "should show charcoal_dust" do
    get :show, :id => @charcoal_dust.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @charcoal_dust.to_param
    assert_response :success
  end

  test "should update charcoal_dust" do
    put :update, :id => @charcoal_dust.to_param, :charcoal_dust => @charcoal_dust.attributes
    assert_redirected_to charcoal_dust_path(assigns(:charcoal_dust))
  end

  test "should destroy charcoal_dust" do
    assert_difference('CharcoalDust.count', -1) do
      delete :destroy, :id => @charcoal_dust.to_param
    end

    assert_redirected_to charcoal_dusts_path
  end
end
