class RemoveCategoryToQuestions < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :Category, :integer
  end
end
