class PdcaPost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  with_options presence: true do
    validates :user_id
    validates :date
    validates :plan
    validates :do
    validates :check
    validates :action
  end
end
