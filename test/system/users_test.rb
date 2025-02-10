require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    sign_in @user
  end

  test "viewing the profile page" do
    visit user_profile_url(@user)
    assert_selector "h1", text: "Your Borrowed Books"
  end

  test "returning a book from the profile page" do
    @book = books(:one)
    Borrowing.create(user: @user, book: @book, borrowed_at: Time.now, due_date: 2.weeks.from_now)
    visit user_profile_url(@user)
    click_on "Return"
    assert_text "You have successfully returned the book."
  end
end
