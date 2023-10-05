class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publisher

  # Validations
  validates :title, presence: true
  validates :author, presence: true
  validates :date_of_publication, presence: true
  validates :publisher, presence: true
  validates :isbn, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :review, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
