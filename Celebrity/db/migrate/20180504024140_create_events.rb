class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.text :text
      t.timestamps
    end
          add_index :events, [:user_id, :created_at]
  end
end
