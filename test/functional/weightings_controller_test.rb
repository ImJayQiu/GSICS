require 'test_helper'

class WeightingsControllerTest < ActionController::TestCase
  setup do
    @weighting = weightings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weightings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create weighting" do
    assert_difference('Weighting.count') do
      post :create, :weighting => @weighting.attributes
    end

    assert_redirected_to weighting_path(assigns(:weighting))
  end

  test "should show weighting" do
    get :show, :id => @weighting.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @weighting.to_param
    assert_response :success
  end

  test "should update weighting" do
    put :update, :id => @weighting.to_param, :weighting => @weighting.attributes
    assert_redirected_to weighting_path(assigns(:weighting))
  end

  test "should destroy weighting" do
    assert_difference('Weighting.count', -1) do
      delete :destroy, :id => @weighting.to_param
    end

    assert_redirected_to weightings_path
  end
end
