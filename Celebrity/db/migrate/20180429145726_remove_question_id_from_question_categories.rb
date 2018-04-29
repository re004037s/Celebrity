class RemoveQuestionIdFromQuestionCategories < ActiveRecord::Migration[5.0]
  def change
    remove_column :question_categories, :question_id, :integer
  end
end
