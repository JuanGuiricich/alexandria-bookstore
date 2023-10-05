class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true
  validates :about, presence: true
  validates :nationality, presence: true
end
