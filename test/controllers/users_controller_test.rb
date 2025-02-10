require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
  end

  test "should get profile" do
    get user_profile_url(@user)
    assert_response :success
  end

  test "should display borrowed books on profile" do
    get user_profile_url(@user)
    assert_select 'h1', 'Your Borrowed Books'
    assert_select 'div', @user.borrowed_books.first.title
  end
end

