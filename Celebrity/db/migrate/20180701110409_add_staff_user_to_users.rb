class AddStaffUserToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :staff_user, :boolean, default: true, null: false
  end
end
