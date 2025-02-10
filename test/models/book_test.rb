require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "should not save book without title" do
    book = Book.new(author: "Author", isbn: "1234567890")
    assert_not book.save, "Saved the book without a title"
  end

  test "should not save book without author" do
    book = Book.new(title: "Book Title", isbn: "1234567890")
    assert_not book.save, "Saved the book without an author"
  end

  test "should not save book without isbn" do
    book = Book.new(title: "Book Title", author: "Author")
    assert_not book.save, "Saved the book without an ISBN"
  end

  test "should save book with valid attributes" do
    book = Book.new(title: "Book Title", author: "Author", isbn: "1234567890", available: true)
    assert book.save, "Failed to save the book with valid attributes"
  end

  test "should not save book with duplicate ISBN" do
    book1 = Book.create(title: "Book Title", author: "Author", isbn: "1234567890", available: true)
    book2 = Book.new(title: "Another Book", author: "Another Author", isbn: "1234567890", available: true)
    assert_not book2.save, "Saved the book with a duplicate ISBN"
  end
end

