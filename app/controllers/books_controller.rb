 class BooksController < ApplicationController
        before_action :authenticate_user!, except: [:index, :show]
      
        def index
          @books = Book.all
        end
      
        def show
          @book = Book.find(params[:id])
        end
      
        def borrow
          @book = Book.find(params[:id])
      
          if @book.available
            @borrow = current_user.borrowings.create(book: @book, borrowed_at: Time.now)
            @book.update(available: false)
            redirect_to user_profile_path(current_user), notice: "You have successfully borrowed the book."
          else
            redirect_to book_path(@book), alert: "This book is already borrowed."
          end
        end
      
        def return_book
          @borrowing = Borrowing.find(params[:id])
          @borrowing.update(returned_at: Time.now)
          @borrowing.book.update(available: true)
          redirect_to user_profile_path(current_user), notice: "You have successfully returned the book."
        end
    end
