class User < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :imports, dependent: :destroy

  has_secure_password
end
