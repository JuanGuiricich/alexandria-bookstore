class PriceUpdateJob < ApplicationJob
  queue_as :default

  def perform(publisher_id, action, percentage)
    # Do something later
    publisher = Publisher.find(publisher_id)
    books = publisher.books
    books.each do |book|
      if action == 'increase'
        book.price = book.price + (book.price * percentage.to_i / 100)
        book.update(price: book.price)
      elsif action == 'decrease'
        book.price = book.price - (book.price * percentage.to_i / 100)
        book.update(price: book.price)
      end
      book.save!
    end
  end
end
