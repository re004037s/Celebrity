class AddItEngineerUserToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :it_engineer_users, :boolean, default: false, null: false
  end
end
