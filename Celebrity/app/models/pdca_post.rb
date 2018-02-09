class PdcaPost < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
end
