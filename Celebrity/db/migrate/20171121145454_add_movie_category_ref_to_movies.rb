class AddMovieCategoryRefToMovies < ActiveRecord::Migration[5.0]
  def change
    add_reference :movies, :movie_category, foreign_key: true
  end
end
