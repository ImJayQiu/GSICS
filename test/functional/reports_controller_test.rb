require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  test "should get daily" do
    get :daily
    assert_response :success
  end

  test "should get period" do
    get :period
    assert_response :success
  end

end
