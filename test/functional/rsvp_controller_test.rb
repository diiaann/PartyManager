require 'test_helper'

class RsvpControllerTest < ActionController::TestCase
  test "should get start" do
    get :start
    assert_response :success
  end

  test "should get form" do
    get :form
    assert_response :success
  end

end
