class Nhaphang < ApplicationRecord
  belongs_to :nguoidung, class_name: Nguoidung.name, foreign_key: "mand"
  belongs_to :sanpham, class_name: Sanpham.name, foreign_key: "masp"

  scope :newest, ->{order created_at: :desc}
end
