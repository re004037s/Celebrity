class AddDeletedAtToQuestionCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :question_categories, :deleted_at, :datetime
  end
end
