class CreateQiitaPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :qiita_posts do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :url

      t.timestamps
    end
    add_index :qiita_posts, [:user_id, :created_at]
  end
end
