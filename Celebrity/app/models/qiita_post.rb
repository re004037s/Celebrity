class QiitaPost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 25 }
  validates :url, presence: true, length: { maximum: 100 }
end