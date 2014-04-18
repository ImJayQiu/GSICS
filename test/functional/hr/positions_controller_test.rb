require 'test_helper'

class Hr::PositionsControllerTest < ActionController::TestCase
  setup do
    @hr_position = hr_positions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hr_positions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hr_position" do
    assert_difference('Hr::Position.count') do
      post :create, :hr_position => @hr_position.attributes
    end

    assert_redirected_to hr_position_path(assigns(:hr_position))
  end

  test "should show hr_position" do
    get :show, :id => @hr_position.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @hr_position.to_param
    assert_response :success
  end

  test "should update hr_position" do
    put :update, :id => @hr_position.to_param, :hr_position => @hr_position.attributes
    assert_redirected_to hr_position_path(assigns(:hr_position))
  end

  test "should destroy hr_position" do
    assert_difference('Hr::Position.count', -1) do
      delete :destroy, :id => @hr_position.to_param
    end

    assert_redirected_to hr_positions_path
  end
end
