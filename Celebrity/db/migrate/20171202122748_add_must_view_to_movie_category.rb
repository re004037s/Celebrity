class AddMustViewToMovieCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :movie_categories, :must_view, :boolean, default: false
  end
end
