class Sanpham < ApplicationRecord
  mount_uploader :hinhanh, HinhanhUploader

  belongs_to :loaisp
  has_many :chitietdh, dependent: :destroy
  has_many :nhaphangs, dependent: :destroy
  has_many :binhluans, dependent: :destroy

  scope :newest, ->{order created_at: :desc}
  scope :by_category, ->category_id{where(loaisp_id: category_id)}
  
  delegate :ten, to: :loaisp, prefix: :loaisp
end
