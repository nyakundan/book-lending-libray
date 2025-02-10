require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
  end

  test "visiting the index" do
    visit books_url
    assert_selector "h1", text: "Available Books"
    assert_selector "p", text: @book.title
  end

  test "borrowing an available book" do
    visit book_url(@book)
    click_on "Borrow"
    assert_text "You have successfully borrowed the book."
  end

  test "seeing borrowed book details on profile" do
    visit user_profile_url(users(:one))
    assert_text "Your Borrowed Books"
    assert_text @book.title
  end
end
