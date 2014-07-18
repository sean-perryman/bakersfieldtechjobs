require 'test_helper'

class RoadmapControllerTest < ActionController::TestCase
  test "should get index if logged in" do
    sign_in users(:regular)
    get :index
    assert_response :success
  end

end
