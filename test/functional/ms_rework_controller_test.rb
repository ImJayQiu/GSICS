require 'test_helper'

class MsReworkControllerTest < ActionController::TestCase
  test "should get lot" do
    get :lot
    assert_response :success
  end

  test "should get bag" do
    get :bag
    assert_response :success
  end

  test "should get remark" do
    get :remark
    assert_response :success
  end

  test "should get operator" do
    get :operator
    assert_response :success
  end

end
