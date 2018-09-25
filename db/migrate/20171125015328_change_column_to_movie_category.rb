class ChangeColumnToMovieCategory < ActiveRecord::Migration[5.0]
  def change
    rename_column :movie_categories, :category_name, :name
  end
end
