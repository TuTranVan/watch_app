class User < ApplicationRecord
  has_many :nhaphangs, dependent: :destroy
  has_many :donhangs, dependent: :destroy
  has_many :dongiaohangs, dependent: :destroy, class_name: Donhang.name, foreign_key: "magh"
  has_many :binhluans, dependent: :destroy

  enum role: {user: 0, admin: 1, shipper: 2, warehouse: 3}
  scope :by_role, ->role{where(role: role)}
  has_secure_password
end
