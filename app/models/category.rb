class Category < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :name, presence: true, uniqueness: {case_sensitive: false},
    length: {maximum: 255}

  scope :alphabet, ->{order name: :asc}
end
