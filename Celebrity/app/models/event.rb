class Event < ApplicationRecord
  has_many :attendances, dependent: :destroy
  mount_uploader :picture, EventsUploader
  default_scope -> { order(created_at: :desc) }
    validates :user_id, presence: true
    validates :title, presence: true, length: { maximum: 150 }
    validates :text, presence: true
    validates :date, presence: true
end
