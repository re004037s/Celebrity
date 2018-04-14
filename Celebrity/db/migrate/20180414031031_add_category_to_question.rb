class AddCategoryToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :Category, :integer
  end
end
