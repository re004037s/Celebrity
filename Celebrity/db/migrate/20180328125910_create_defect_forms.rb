class CreateDefectForms < ActiveRecord::Migration[5.0]
  def change
    create_table :defect_forms do |t|
      t.string :name
      t.string :mail
      t.string :type
      t.text :contents

      t.timestamps
    end
  end
end
