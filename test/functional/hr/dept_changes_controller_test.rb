require 'test_helper'

class Hr::DeptChangesControllerTest < ActionController::TestCase
  setup do
    @hr_dept_change = hr_dept_changes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hr_dept_changes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hr_dept_change" do
    assert_difference('Hr::DeptChange.count') do
      post :create, :hr_dept_change => @hr_dept_change.attributes
    end

    assert_redirected_to hr_dept_change_path(assigns(:hr_dept_change))
  end

  test "should show hr_dept_change" do
    get :show, :id => @hr_dept_change.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @hr_dept_change.to_param
    assert_response :success
  end

  test "should update hr_dept_change" do
    put :update, :id => @hr_dept_change.to_param, :hr_dept_change => @hr_dept_change.attributes
    assert_redirected_to hr_dept_change_path(assigns(:hr_dept_change))
  end

  test "should destroy hr_dept_change" do
    assert_difference('Hr::DeptChange.count', -1) do
      delete :destroy, :id => @hr_dept_change.to_param
    end

    assert_redirected_to hr_dept_changes_path
  end
end
