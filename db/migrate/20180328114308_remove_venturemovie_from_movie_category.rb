class RemoveVenturemovieFromMovieCategory < ActiveRecord::Migration[5.0]
  def change
    remove_column :movie_categories, :venture_movie, :boolean
    remove_column :movie_categories, :free_engineer_movie, :boolean
  end
end
