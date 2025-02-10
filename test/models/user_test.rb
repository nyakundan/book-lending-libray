equire 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should have many borrowings" do
    user = users(:one) # assuming you have fixtures for users
    assert_respond_to user, :borrowings
  end

  test "should have many borrowed books through borrowings" do
    user = users(:one)
    assert_respond_to user, :borrowed_books
  end
end
