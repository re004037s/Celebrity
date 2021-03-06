class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :body
      t.string :thumbnail
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
