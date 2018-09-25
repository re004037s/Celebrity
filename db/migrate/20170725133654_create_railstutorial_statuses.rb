class CreateRailstutorialStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :railstutorial_statuses do |t|
      t.belongs_to :user
      t.boolean :chapter1, default: false
      t.boolean :chapter2, default: false
      t.boolean :chapter3, default: false
      t.boolean :chapter4, default: false
      t.boolean :chapter5, default: false
      t.boolean :chapter6, default: false
      t.boolean :chapter7, default: false
      t.boolean :chapter8, default: false
      t.boolean :chapter9, default: false
      t.boolean :chapter10, default: false
      t.boolean :chapter11, default: false
      t.boolean :chapter12, default: false
      t.boolean :chapter13, default: false
      t.boolean :chapter14, default: false

      t.timestamps
    end
  end
end
