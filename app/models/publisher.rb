class Publisher < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :name, presence: true, uniqueness: {case_sensitive: false},
    length: {maximum: 255}
  validates :phone, presence: true,
    length: {maximum: 10}
  validates :address, presence: true

  scope :alphabet, ->{order name: :asc}
end
