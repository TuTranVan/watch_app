class Book < ApplicationRecord
  belongs_to :category
  mount_uploader :image, ImageUploader

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :request_details, dependent: :destroy
  has_many :imports, dependent: :destroy

  validates :name, presence: true, uniqueness: {case_sensitive: false},
    length: {maximum: 255}
  validates :num_of_pages, presence: true, numericality: {only_integer: true}
  validates :image, presence: true
  validates :author, presence: true
  validates :publisher, presence: true
  validates :content, presence: true
  validates :year, presence: true
  validates :price, presence: true, numericality: {only_integer: true}

  scope :newest, ->{order created_at: :desc}

  delegate :name, to: :category, prefix: :category

  def comments_newest
    comments.newest
  end
end
