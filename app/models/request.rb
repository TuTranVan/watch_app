class Request < ApplicationRecord
  belongs_to :user
  has_many :request_details, dependent: :destroy

  validates :from_date, presence: true

  enum status: {start: 0, processing: 1, finish: 2}
end
