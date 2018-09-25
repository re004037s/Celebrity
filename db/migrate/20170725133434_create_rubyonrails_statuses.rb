class CreateRubyonrailsStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :rubyonrails_statuses do |t|
      t.belongs_to :user
      t.boolean :ga_1, default: false
      t.boolean :ga_2, default: false
      t.boolean :ga_3, default: false
      t.boolean :ga_4, default: false
      t.boolean :ga_5, default: false
      t.boolean :ga_6, default: false
      t.boolean :ga_7, default: false
      t.boolean :ga_8, default: false
      t.boolean :ga_9, default: false
      t.boolean :ga_10, default: false
      t.boolean :ga_11, default: false
      t.boolean :do_1, default: false
      t.boolean :do_2, default: false
      t.boolean :do_3, default: false
      t.boolean :do_4, default: false

      t.timestamps
    end
  end
end
