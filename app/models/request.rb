class Request < ApplicationRecord
  belongs_to :user
  has_many :request_details, dependent: :destroy

  validates :from_date, presence: true

  enum status: {not_approved: 0, approved: 1, reject: 2}
end
