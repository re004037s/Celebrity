class Question < ApplicationRecord
  
   def self.compare_date(questions)
     questions_compared = []
     questions.each {|quest| questions_compared << quest if quest.created_at + 1.week >= Date.today }
     questions_compared
     
   end
end
