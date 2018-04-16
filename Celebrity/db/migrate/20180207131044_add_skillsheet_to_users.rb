class AddSkillsheetToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :skillsheet, :binary
    add_column :users, :skillsheet_name, :string, default: '未登録'
  end
end
