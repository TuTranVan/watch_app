class Sanpham < ApplicationRecord
  mount_uploader :hinhanh, HinhanhUploader

  belongs_to :loaisp, class_name: Loaisp.name, foreign_key: "maloai"
  has_many :chitietdh, dependent: :destroy, class_name: Chitietdh.name, foreign_key: "masp"
  has_many :nhaphangs, dependent: :destroy, class_name: Nhaphang.name, foreign_key: "masp"
  has_many :binhluans, dependent: :destroy, class_name: Binhluan.name, foreign_key: "masp"

  scope :newest, ->{order created_at: :desc}
  scope :by_category, ->category_id{where(loaisp_id: category_id)}

  delegate :ten, to: :loaisp, prefix: :loaisp
end
