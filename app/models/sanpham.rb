class Sanpham < ApplicationRecord
  belongs_to :loaisp
  mount_uploader :hinhanh, ImageUploader

  has_many :binhluans, dependent: :destroy
  has_many :chitietdh, dependent: :destroy
  has_many :nhaphangs, dependent: :destroy

  scope :newest, ->{order created_at: :desc}
  scope :by_category, ->category_id{where(loaiso_id: category_id)}
end
