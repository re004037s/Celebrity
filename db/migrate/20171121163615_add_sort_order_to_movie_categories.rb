class AddSortOrderToMovieCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :movie_categories, :sort_order, :integer
  end
end
