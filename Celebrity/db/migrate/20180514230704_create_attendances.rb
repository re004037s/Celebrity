class CreateAttendances < ActiveRecord::Migration[5.0]
  def change
    create_table :attendances do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.boolean :status

      t.timestamps
    end
  end
end
