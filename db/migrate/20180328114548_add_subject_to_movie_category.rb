class AddSubjectToMovieCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :movie_categories, :subject, :string
  end
end
