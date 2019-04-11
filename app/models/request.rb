class Request < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :quantity, presence: true, numericality: {only_integer: true}
  validates :from_date, presence: true
  validates :to_date, presence: true
  validate :to_date_after_from_date
  validates :real_date, presence: true
  validates :out_date, presence: true
  validates :rental, presence: true
  validates :forfeit, presence: true
  validates :damage, presence: true
  validates :miss, presence: true
  validates :status, presence: true

  enum status: {not_approved: 0, approved: 1, reject: 2}
end
