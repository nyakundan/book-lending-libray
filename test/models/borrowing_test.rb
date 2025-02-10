require 'test_helper'

class BorrowingTest < ActiveSupport::TestCase
  test "should not save borrowing without a user" do
    book = books(:one) # assuming you have fixtures for books
    borrowing = Borrowing.new(book: book, borrowed_at: Time.now, due_date: 2.weeks.from_now)
    assert_not borrowing.save, "Saved the borrowing without a user"
  end

  test "should not save borrowing without a book" do
    user = users(:one) # assuming you have fixtures for users
    borrowing = Borrowing.new(user: user, borrowed_at: Time.now, due_date: 2.weeks.from_now)
    assert_not borrowing.save, "Saved the borrowing without a book"
  end

  test "should set a due date automatically" do
    user = users(:one)
    book = books(:one)
    borrowing = Borrowing.create(user: user, book: book, borrowed_at: Time.now)
    assert_not_nil borrowing.due_date, "Due date was not set"
  end
end
