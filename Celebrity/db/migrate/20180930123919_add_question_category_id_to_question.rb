class AddQuestionCategoryIdToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :question_category_id, :integer
  end
end
