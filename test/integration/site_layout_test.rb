require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

   test "layout links" do
    get home_path
    assert_template 'static_pages/home'
    # assert_select "a[href=?]", login_path
    assert_select "a[href=?]", home_path, count: 2
    assert_select "a[href=?]", about_path
    # assert_select "a[href=?]", about_path
    # assert_select "a[href=?]", contact_path
    # get signup_path
    # assert_select "title", full_title("Sign up")
    # log_in_as(@user)
    # get root_path
    # assert_select "a[href=?]", users_path
    # assert_select "a[href=?]", login_path, count: 0
    # assert_select "a[href=?]", logout_path
   end  
end
