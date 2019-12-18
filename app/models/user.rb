class User < ApplicationRecord
  has_many :binhluans, dependent: :destroy
  has_many :nhaphangs, dependent: :destroy
  has_many :donhangs, dependent: :destroy

  enum role: {user: 0, admin: 1}
  has_secure_password
end
