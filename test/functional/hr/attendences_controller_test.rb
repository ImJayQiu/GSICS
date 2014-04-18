require 'test_helper'

class Hr::AttendencesControllerTest < ActionController::TestCase
  setup do
    @hr_attendence = hr_attendences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hr_attendences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hr_attendence" do
    assert_difference('Hr::Attendence.count') do
      post :create, :hr_attendence => @hr_attendence.attributes
    end

    assert_redirected_to hr_attendence_path(assigns(:hr_attendence))
  end

  test "should show hr_attendence" do
    get :show, :id => @hr_attendence.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @hr_attendence.to_param
    assert_response :success
  end

  test "should update hr_attendence" do
    put :update, :id => @hr_attendence.to_param, :hr_attendence => @hr_attendence.attributes
    assert_redirected_to hr_attendence_path(assigns(:hr_attendence))
  end

  test "should destroy hr_attendence" do
    assert_difference('Hr::Attendence.count', -1) do
      delete :destroy, :id => @hr_attendence.to_param
    end

    assert_redirected_to hr_attendences_path
  end
end
