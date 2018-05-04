class Blog < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true
  validates :thumbnail, presence: true
  mount_uploader :thumbnail, ThumbnailUploader
end
