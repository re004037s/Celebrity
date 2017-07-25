class CreateViews < ActiveRecord::Migration[5.0]
  def change
    create_table :views do |t|
      t.references :user, foreign_key: true
      t.references :movie, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :movie_id], unique: true
    end
  end
end
