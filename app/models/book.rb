class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publisher

  include PgSearch::Model

  pg_search_scope :search_by_title_and_author_and_publisher,
  against: [ :title, :isbn ],
  associated_against: {
    author: [ :first_name, :last_name ],
    publisher: [:name]
  },
  using: {
    tsearch: { prefix: true }
  }


  # Validations
  validates :title, presence: true
  validates :author, presence: true
  validates :date_of_publication, presence: true
  validates :publisher, presence: true
  validates :isbn, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :review, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
