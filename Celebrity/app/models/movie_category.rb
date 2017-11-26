class MovieCategory < ApplicationRecord
  include SessionsHelper
  acts_as_paranoid
  has_many :movies
end
