class AddVenturemovieFreeengineermovieToMovieCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :movie_categories, :venture_movie, :boolean, default: false, null: false
    add_column :movie_categories, :free_engineer_movie, :boolean, default: true, null: false
  end
end
