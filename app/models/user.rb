class User < ApplicationRecord
  has_many :nhaphangs, dependent: :destroy
  has_many :donhangs, dependent: :destroy

  enum role: {user: 0, admin: 1}
  scope :by_role, ->role{where(role: role)}
  has_secure_password
end
