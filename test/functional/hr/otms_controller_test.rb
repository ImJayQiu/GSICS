require 'test_helper'

class Hr::OtmsControllerTest < ActionController::TestCase
  setup do
    @hr_otm = hr_otms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hr_otms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hr_otm" do
    assert_difference('Hr::Otm.count') do
      post :create, :hr_otm => @hr_otm.attributes
    end

    assert_redirected_to hr_otm_path(assigns(:hr_otm))
  end

  test "should show hr_otm" do
    get :show, :id => @hr_otm.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @hr_otm.to_param
    assert_response :success
  end

  test "should update hr_otm" do
    put :update, :id => @hr_otm.to_param, :hr_otm => @hr_otm.attributes
    assert_redirected_to hr_otm_path(assigns(:hr_otm))
  end

  test "should destroy hr_otm" do
    assert_difference('Hr::Otm.count', -1) do
      delete :destroy, :id => @hr_otm.to_param
    end

    assert_redirected_to hr_otms_path
  end
end
