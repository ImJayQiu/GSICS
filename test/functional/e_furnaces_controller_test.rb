require 'test_helper'

class EFurnacesControllerTest < ActionController::TestCase
  setup do
    @e_furnace = e_furnaces(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:e_furnaces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create e_furnace" do
    assert_difference('EFurnace.count') do
      post :create, :e_furnace => @e_furnace.attributes
    end

    assert_redirected_to e_furnace_path(assigns(:e_furnace))
  end

  test "should show e_furnace" do
    get :show, :id => @e_furnace.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @e_furnace.to_param
    assert_response :success
  end

  test "should update e_furnace" do
    put :update, :id => @e_furnace.to_param, :e_furnace => @e_furnace.attributes
    assert_redirected_to e_furnace_path(assigns(:e_furnace))
  end

  test "should destroy e_furnace" do
    assert_difference('EFurnace.count', -1) do
      delete :destroy, :id => @e_furnace.to_param
    end

    assert_redirected_to e_furnaces_path
  end
end
