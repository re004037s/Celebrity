class CreateDefectForms < ActiveRecord::Migration[5.0]
  def change
    create_table :defect_forms do |t|

      t.timestamps
    end
  end
end
