class Donhang < ApplicationRecord
  belongs_to :user
  has_many :chitietdhs, dependent: :destroy
  has_many :nguoinhans, dependent: :destroy

  enum trangthai: {ordering: 0, shiping: 1, finish: 2}

  scope :by_status, ->status{where(trangthai: status)}
  scope :order_status, ->{order trangthai: :asc}
end
