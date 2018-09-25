class PdcaPost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  with_options presence: true do
    validates :user_id
    validates :date
    validates :plan, length: { maximum: 1000 }
    validates :do, length: { maximum: 1000 }
    validates :check, length: { maximum: 1000 }
    validates :action, length: { maximum: 1000 }
  end
end
