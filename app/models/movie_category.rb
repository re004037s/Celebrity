class MovieCategory < ApplicationRecord
  include SessionsHelper
  acts_as_paranoid
  has_many :movies, dependent: :destroy
  validates :name, presence: true, length: { maximum: 12 }
end
