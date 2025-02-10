require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @book = books(:one)
    sign_in @user
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should show book details" do
    get book_url(@book)
    assert_response :success
  end

  test "should borrow an available book" do
    assert_difference('@user.borrowed_books.count', 1) do
      post borrow_book_url(@book)
    end
    assert_redirected_to user_profile_path(@user)
  end

  test "should not borrow a borrowed book" do
    @book.update(available: false)
    post borrow_book_url(@book)
    assert_redirected_to book_path(@book)
    assert_match "This book is already borrowed", flash[:alert]
  end

  test "should return a borrowed book" do
    borrowing = Borrowing.create(user: @user, book: @book, borrowed_at: Time.now, due_date: 2.weeks.from_now)
    patch return_book_url(borrowing)
    assert_redirected_to user_profile_path(@user)
    @book.reload
    assert @book.available
  end
end

