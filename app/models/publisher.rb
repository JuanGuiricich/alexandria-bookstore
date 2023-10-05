class Publisher < ApplicationRecord
  has_many :books

  # Validations
  validates :name, presence: true
  validates :name, length: { minimum: 2 }
end
