require 'test_helper'

class SampleresultsControllerTest < ActionController::TestCase
  setup do
    @sampleresult = sampleresults(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sampleresults)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sampleresult" do
    assert_difference('Sampleresult.count') do
      post :create, :sampleresult => @sampleresult.attributes
    end

    assert_redirected_to sampleresult_path(assigns(:sampleresult))
  end

  test "should show sampleresult" do
    get :show, :id => @sampleresult.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @sampleresult.to_param
    assert_response :success
  end

  test "should update sampleresult" do
    put :update, :id => @sampleresult.to_param, :sampleresult => @sampleresult.attributes
    assert_redirected_to sampleresult_path(assigns(:sampleresult))
  end

  test "should destroy sampleresult" do
    assert_difference('Sampleresult.count', -1) do
      delete :destroy, :id => @sampleresult.to_param
    end

    assert_redirected_to sampleresults_path
  end
end
