class MovieCategory < ApplicationRecord
  acts_as_paranoid
  has_many :movies
end
