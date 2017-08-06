class RemoveImpressionFromMovies < ActiveRecord::Migration[5.0]
  def change
    remove_column :movies, :impression, :text
  end
end
