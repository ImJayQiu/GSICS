require 'test_helper'

class AnalysisControllerTest < ActionController::TestCase
  test "should get silicon" do
    get :silicon
    assert_response :success
  end

end
