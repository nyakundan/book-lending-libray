class User < ApplicationRecord
  # Devise modules
  has_many :borrowings
  has_many :borrowed_books, through: :borrowings, source: :book
end
