class Feedback < ApplicationRecord
  belongs_to :user
  validates :feedback, presence: true, length: { minimum: 200 }
end