class Movie < ApplicationRecord
  
  validates :impression, presence: true, length: { minimum: 100 }
  
  has_many :views
  has_many :users, through: :views
end
