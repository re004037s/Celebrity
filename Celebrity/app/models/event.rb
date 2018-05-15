class Event < ApplicationRecord
  has_many :attendances, dependent: :destroy
  has_many :users, through: :attendances
  mount_uploader :picture, EventsUploader
  default_scope -> { order(created_at: :desc) }
    validates :user_id, presence: true
    validates :title, presence: true, length: { maximum: 150 }
    validates :text, presence: true
    validates :date, presence: true
end
