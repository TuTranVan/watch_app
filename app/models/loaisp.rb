class Loaisp < ApplicationRecord
  has_many :sanphams, dependent: :destroy, class_name: Sanpham.name, foreign_key: "maloai"
end
