require 'test_helper'

class ImpressControllerTest < ActionController::TestCase
  test "should get microsilica" do
    get :microsilica
    assert_response :success
  end

end
