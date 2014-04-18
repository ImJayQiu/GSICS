require 'test_helper'

class ItRepairsControllerTest < ActionController::TestCase
  setup do
    @it_repair = it_repairs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:it_repairs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create it_repair" do
    assert_difference('ItRepair.count') do
      post :create, :it_repair => @it_repair.attributes
    end

    assert_redirected_to it_repair_path(assigns(:it_repair))
  end

  test "should show it_repair" do
    get :show, :id => @it_repair.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @it_repair.to_param
    assert_response :success
  end

  test "should update it_repair" do
    put :update, :id => @it_repair.to_param, :it_repair => @it_repair.attributes
    assert_redirected_to it_repair_path(assigns(:it_repair))
  end

  test "should destroy it_repair" do
    assert_difference('ItRepair.count', -1) do
      delete :destroy, :id => @it_repair.to_param
    end

    assert_redirected_to it_repairs_path
  end
end
