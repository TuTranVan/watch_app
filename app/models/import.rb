class Import < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :quantity, presence: true, numericality: {only_integer: true}

  scope :newest, ->{order created_at: :desc}
end
