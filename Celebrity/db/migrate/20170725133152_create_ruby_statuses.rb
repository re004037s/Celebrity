class CreateRubyStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :ruby_statuses do |t|
      t.belongs_to :user
      t.boolean :ga_1, default: false
      t.boolean :ga_2, default: false
      t.boolean :ga_3, default: false
      t.boolean :ga_4, default: false
      t.boolean :ga_5, default: false

      t.timestamps
    end
  end
end
