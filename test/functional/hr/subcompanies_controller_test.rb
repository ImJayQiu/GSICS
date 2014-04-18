require 'test_helper'

class Hr::SubcompaniesControllerTest < ActionController::TestCase
  setup do
    @hr_subcompany = hr_subcompanies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hr_subcompanies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hr_subcompany" do
    assert_difference('Hr::Subcompany.count') do
      post :create, :hr_subcompany => @hr_subcompany.attributes
    end

    assert_redirected_to hr_subcompany_path(assigns(:hr_subcompany))
  end

  test "should show hr_subcompany" do
    get :show, :id => @hr_subcompany.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @hr_subcompany.to_param
    assert_response :success
  end

  test "should update hr_subcompany" do
    put :update, :id => @hr_subcompany.to_param, :hr_subcompany => @hr_subcompany.attributes
    assert_redirected_to hr_subcompany_path(assigns(:hr_subcompany))
  end

  test "should destroy hr_subcompany" do
    assert_difference('Hr::Subcompany.count', -1) do
      delete :destroy, :id => @hr_subcompany.to_param
    end

    assert_redirected_to hr_subcompanies_path
  end
end
