class RemoveAddCategoryIdToQiestions < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :category_id, :integer
  end
end
