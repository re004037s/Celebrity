class CreateMovieCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :movie_categories do |t|
      t.string :category_name
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :movie_categories, :deleted_at
  end
end
