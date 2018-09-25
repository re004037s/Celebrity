class AddVentureUserToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :venture_user, :boolean, default: false, null: false
  end
end
