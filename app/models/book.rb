class Book < ApplicationRecord
  belongs_to :publisher
  belongs_to :category
  mount_uploader :image, ImageUploader

  has_many :likes, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :imports, dependent: :destroy
end
