require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get home_path
    assert_response :success
    assert_select "title", "Home | Private Events App"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | Private Events App"
  end
end
