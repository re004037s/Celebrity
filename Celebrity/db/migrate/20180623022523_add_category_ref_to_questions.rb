class AddCategoryRefToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_reference :questions, :question_category, foreign_key: true
  end
end
