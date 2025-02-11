# README

# Book Lending Library

A simple web application for a Book Lending Library built with Ruby on Rails.

This project allows users to:
- Browse books available for lending.
- Check out books from the library.
- Return borrowed books.
- View the borrowing history.

## Features

- **User Authentication**: Sign up, login, and manage accounts.
- **Book Catalog**: View available books in the library.
- **Borrowing System**: Borrow and return books easily.
- **Admin Panel**: For managing books, users, and lending transactions.

## Requirements

- Ruby 3.x
- Rails 7.x
- SQLite3 (or your preferred database)
- Node.js (for managing JavaScript dependencies)
- Yarn (for managing frontend dependencies)

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/nyakundan/book-lending-libray.git
cd book-lending-libray

2. Install Ruby dependencies
Ensure you have the correct version of Ruby installed. You can use RVM or rbenv to manage Ruby versions.

Then, install the required gems:
bundle install

3. Set up the database
Run the following commands to set up the database:
rails db:create
rails db:migrate
rails db:seed
 # Optional: Seed the database with sample data

4. Install JavaScript dependencies
yarn install

5. Start the Rails server
rails server
Now, visit http://localhost:3000 in your browser to view the app.


Usage
Once the app is running:

Sign Up: Create a new account if you're a new user.
Login: Log in to borrow and manage books.
Browse Books: Browse the list of available books.
Borrow Books: Borrow books and keep track of your borrowed items.
Admin Access: Admins can add, update, or remove books from the library.


Contributing
Contributions are welcome! If you'd like to contribute to this project:

Fork this repository.
Create a new branch: git checkout -b feature-name.
Make your changes.
Commit your changes: git commit -m 'Add new feature'.
Push to the branch: git push origin feature-name.
Create a pull request.

