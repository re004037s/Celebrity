class AddSkillsheetToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :skillsheet, :binary
    add_column :users, :skillsheet_name, :string
  end
end
