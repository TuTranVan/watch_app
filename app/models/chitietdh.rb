class Chitietdh < ApplicationRecord
  belongs_to :donhang, class_name: Donhang.name, foreign_key: "madh"
  belongs_to :sanpham, class_name: Sanpham.name, foreign_key: "masp"
end
