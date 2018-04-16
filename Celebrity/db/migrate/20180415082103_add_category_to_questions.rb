class AddCategoryToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :category, :string
  end
end
