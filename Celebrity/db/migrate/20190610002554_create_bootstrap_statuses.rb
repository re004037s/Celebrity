class CreateBootstrapStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :bootstrap_statuses do |t|
      t.belongs_to :user
      t.boolean :ga_1, default: false
      t.boolean :ga_2, default: false

      t.timestamps
    end
  end
end
