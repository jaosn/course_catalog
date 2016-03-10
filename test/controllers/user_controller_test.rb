require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get subject" do
    get :subject
    assert_response :success
  end

  test "should get course" do
    get :course
    assert_response :success
  end

  test "should get instructor" do
    get :instructor
    assert_response :success
  end

end
