class Publisher < ApplicationRecord
  has_many :books

  include PgSearch::Model

  pg_search_scope :search_publisher,
  against: [ :name ],
  using: {
    tsearch: { prefix: true }
  }

  # Validations
  validates :name, presence: true
  validates :name, length: { minimum: 2 }
end
