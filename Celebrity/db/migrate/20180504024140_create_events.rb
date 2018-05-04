class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.date :date
      t.text :text

      t.timestamps
    end
  end
end
