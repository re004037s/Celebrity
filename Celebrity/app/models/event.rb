class Event < ApplicationRecord
  has_many :attendances, dependent: :destroy
  mount_uploader :picture, EventsUploader
  
end
