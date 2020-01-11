class Nguoidung < ApplicationRecord
  has_many :nhaphangs, dependent: :destroy, class_name: Nhaphang.name, foreign_key: "mand"
  has_many :donhangs, dependent: :destroy, class_name: Donhang.name, foreign_key: "mand"
  has_many :dongiaohangs, dependent: :destroy, class_name: Donhang.name, foreign_key: "magh"
  has_many :binhluans, dependent: :destroy, class_name: Binhluan.name, foreign_key: "mand"

  enum role: {user: 0, admin: 1, shipper: 2, warehouse: 3}
  scope :by_role, ->role{where(role: role)}
  has_secure_password
end
