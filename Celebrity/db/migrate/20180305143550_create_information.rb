class CreateInformation < ActiveRecord::Migration[5.0]
  def change
    create_table :information do |t|
      t.text :info
      t.date :display_period

      t.timestamps
    end
  end
end
