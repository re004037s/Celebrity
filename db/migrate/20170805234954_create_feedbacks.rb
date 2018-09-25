class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.text :feedback
      t.integer :movie_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
