class Nhaphang < ApplicationRecord
  belongs_to :user
  belongs_to :sanpham

  scope :newest, ->{order created_at: :desc}
end
