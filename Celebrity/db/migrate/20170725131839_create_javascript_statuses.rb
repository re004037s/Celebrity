class CreateJavascriptStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :javascript_statuses do |t|
      t.belongs_to :user
      t.boolean :ga_beginner, default: false
      t.boolean :do_beginner, default: false
      
      
      t.timestamps
    end
  end
end
