class CreateInterviewPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :interview_posts do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :language
      t.string :experience
      t.string :type
      t.integer :user_id
      t.date :day
      t.text :summary
      t.text :question
      t.string :result

      t.timestamps
    end
    add_index :interview_posts, [:user_id, :created_at]
  end
end
