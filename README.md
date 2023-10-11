# Alexandria BookStore

This is a Project made for IT Crowd as part of the Junior Fullstack Rails Challenge for the Junior Fullstack Rails position.

This project was created using Ruby, with it's Ruby on Rails framework, HTML, CSS and Javascript with frameworks.

## Solution and Features

An app where users can log in, view all the books available, filter using an interactive search bar and add/remove books from favorites when logged in. Also the Admin can log in and edit books, authors and publishers in an admin dashboard and increase the price for all the books from a publisher in a simple way.

you can check the live project here:

[Alexandria Bookstore](https://alexandria-bookstore-64efd0d92505.herokuapp.com/)

## Run Locally

In order to run this app locally, be sure to clone the repository to your computer

then run
```
$rails db:migrate
$rails db:seed
$rails s
```
and be sure to run another terminal with sidekiq
```
$sidekiq
```
## Gems

For this project I used the following Gems:

Devise Gem for user management
```
gem 'devise'
```
Faker gem for generating fake data
```
gem 'faker'
```
Pg Search gem for search functionality
```
gem "pg_search"
```
Kaminari gem for pagination
```
gem 'kaminari'
```
acts_as_favoritor gem for favoriting functionality
```
gem 'acts_as_favoritor'
```
Initials Avatar gem for generating user avatars
```
gem 'initials'
```
Sidekiq gem for background jobs
```
gem 'sidekiq'
```
```
gem "sidekiq-failures", "~> 1.0"
```
pry gem for debugging
```
gem 'pry'
```
Bootstrap for styles
```
gem "bootstrap", "~> 5.2"
```
Font awesome for icons
```
gem "font-awesome-sass", "~> 6.1"
```
Simple Form for forms
```
gem "simple_form", github: "heartcombo/simple_form"
```
## How the API works

Create a Book:

To create a new book, make a POST request to the following endpoint:
```
POST /api/books
```
Request Body (JSON): Provide the book details in the request body using the book object with the following attributes: title, isbn, date_of_publication, review, price, author_id, publisher_id.

Response (JSON): Upon successful creation, the API will respond with the created book object.

Update a Book:

To update an existing book, make a PUT or PATCH request to the specific book's endpoint, where {id} is the unique identifier of the book you want to update:
```
PUT /api/books/{id}
```
OR
```
PATCH /api/books/{id}
```
Request Body (JSON): Include the book attributes you want to update within the request body.

Response (JSON): The API will return the updated book object.

Delete a Book:

To delete a book, make a DELETE request to the specific book's endpoint, where {id} is the unique identifier of the book you want to delete:
```
DELETE /api/books/{id}
```
Response: The API will respond with a "no content" status (HTTP 204) to indicate a successful deletion.

Filter:
   - To filter by name:
     ```
     GET /api/books?name=Sample
     ```

   - To filter by price range:
     ```
     GET /api/books?min_price=10&max_price=20
     ```

   - To filter by author:
     ```
     GET /api/books?author=John
     ```
# My thoughts and learnings

When I started this project I knew it would't be easy, I was required to build an app from scratch in one week and there were things I didn't knew how to do. I had to do lot's of research on different topics like Stimulus, API and Deploy
