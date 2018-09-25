class AddSortOrderToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :sort_order, :integer
  end
end
