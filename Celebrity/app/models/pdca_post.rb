class PdcaPost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  with_options presence: true do
  validates :plan
  validates :do
  validates :check
  validates :action
  end
end
