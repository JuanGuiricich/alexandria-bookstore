class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  include PgSearch::Model

  pg_search_scope :search_author,
  against: [ :first_name, :last_name, :date_of_birth, :nationality, :about  ],
  using: {
    tsearch: { prefix: true }
  }

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true
  validates :about, presence: true
  validates :nationality, presence: true
end
