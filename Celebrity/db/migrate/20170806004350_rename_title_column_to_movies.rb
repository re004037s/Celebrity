class RenameTitleColumnToMovies < ActiveRecord::Migration[5.0]
  def change
    rename_column :movies, :movie_title, :title
    rename_column :movies, :movie_path, :path
  end
end
