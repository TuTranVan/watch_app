class User < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :imports, dependent: :destroy

  validates :name, presence: true, length: {maximum: 80}
  validates :address, presence: true
  validates :phone, presence: true, length: {maximum: 10}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 50},
   format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true

  enum role: {user: 0, admin: 1}

  has_secure_password

  scope :alphabet, ->{order name: :asc}
  scope :by_role, ->role{where(role: role)}

  private

  def downcase_email
    self.email = email.downcase
  end
end
