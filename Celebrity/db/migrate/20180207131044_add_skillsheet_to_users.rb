class AddSkillsheetToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :skillsheet, :binary
  end
end
