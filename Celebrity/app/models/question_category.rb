class QuestionCategory < ApplicationRecord
  acts_as_paranoid
  has_many :questions, :dependent => :delete_all
end
