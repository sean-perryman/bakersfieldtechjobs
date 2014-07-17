require 'test_helper'

class RoadmapControllerTest < ActionController::TestCase
  test "should get index if logged in" do
    sign_in users(:sean)
    get :index
    assert_response :success
  end

end
