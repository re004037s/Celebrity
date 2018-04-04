class Feedback < ApplicationRecord
  belongs_to :user
  validates :feedback, presence: true, length: { minimum: 100, maximum: 500 }
end