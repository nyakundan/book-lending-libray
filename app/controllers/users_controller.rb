class UsersController < ApplicationController
  def profile
    @borrowed_books = current_user.borrowed_books
  end
end
