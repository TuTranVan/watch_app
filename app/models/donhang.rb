class Donhang < ApplicationRecord
  belongs_to :user
  has_many :chitietdhs, dependent: :destroy


  enum status: {ordering: 0, shiping: 1, finish: 2}

  scope :by_status, ->status{where(trangthai: status)}
end
