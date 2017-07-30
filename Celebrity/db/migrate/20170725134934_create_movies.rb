class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :movie_title
      t.string :movie_path
      t.text :impression

      t.timestamps
    end
  end
end
