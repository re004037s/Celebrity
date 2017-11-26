class Movie < ApplicationRecord
  acts_as_paranoid
  has_many :feedbacks
  belongs_to :movie_category

  validates :title, presence: true, length: { maximum: 50 }
  validates :path, presence: true, length: { maximum: 100 }

end