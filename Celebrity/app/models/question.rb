class Question < ApplicationRecord
    belongs_to :question_category, optional: true
end
