class Event < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, EventsUploader
  
end
