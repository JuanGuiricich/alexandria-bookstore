# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Destroying all records..."
Author.destroy_all
Publisher.destroy_all
Book.destroy_all

puts "Creating records..."
puts "Creating authors..."
25.times do
  Author.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65),
    about: Faker::Lorem.paragraph(sentence_count: 2),
    nationality: Faker::Address.country
  )
end

puts "Creating publishers..."
25.times do
  Publisher.create(
    name: Faker::Book.publisher
  )
end

puts "Creating books..."
100.times do
  Book.create(
    title: Faker::Book.title,
    isbn: Faker::Code.isbn,
    date_of_publication: Faker::Date.between(from: 10.years.ago, to: Date.today),
    review: Faker::Number.between(from: 1, to: 5),
    author_id: Author.all.sample.id,
    publisher_id: Publisher.all.sample.id,
    price: Faker::Commerce.price
  )
end

book = Book.create(
  title: "titulo",
  isbn: "1234",
  date_of_publication: "2022-02-01",
  review: 2,
  author_id: 3,
  publisher_id: 4,
  price: 50.0
)
book.save!

puts "Done!"
