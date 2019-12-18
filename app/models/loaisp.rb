class Loaisp < ApplicationRecord
  has_many :sanphams, dependent: :destroy
end
