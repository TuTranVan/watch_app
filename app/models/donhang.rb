class Donhang < ApplicationRecord
  belongs_to :nguoidung, class_name: Nguoidung.name, foreign_key: "mand", optional: true
  has_many :chitietdhs, dependent: :destroy, class_name: Chitietdh.name, foreign_key: "madh"
  has_many :nguoinhans, dependent: :destroy, class_name: Nguoinhan.name, foreign_key: "madh"
  belongs_to :giaohang, class_name: Nguoidung.name, foreign_key: "magh", optional: true

  enum trangthai: {ordering: 0, shiping: 1, finish: 2}

  scope :by_status, ->status{where(trangthai: status)}
  scope :order_status, ->{order trangthai: :asc}
end
